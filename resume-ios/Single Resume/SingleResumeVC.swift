//
//  SingleResumeVC.swift
//  resume-ios
//
//  Created by Patrick Ngo on 2017-12-17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class SingleResumeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var isLoading: Bool = false
    var resume: ResumeModel?
    
    enum Section : Int {
        case header = 0
        case about
        case experience
        case education
        case contact
        case noOfSections
        
        func name() -> String {
            switch self {
                
            case .header: return "Header"
            case .about: return "About"
            case .experience: return "Experience"
            case .education: return "Education"
            case .contact: return "Contact"
            case .noOfSections: return ""
            }
        }
    }

    
    //MARK: - Views -
    
    private lazy var tableView : UITableView = {
        
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.separatorStyle = .none
        tv.backgroundColor = UIColor.Background.grey
        
        tv.delegate = self
        tv.dataSource = self
        
        //cell registration
        tv.register(SingleResumeHeaderCell.self, forCellReuseIdentifier: String(describing: SingleResumeHeaderCell.self))
        tv.register(SingleResumeAboutCell.self, forCellReuseIdentifier: String(describing: SingleResumeAboutCell.self))
        tv.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        
        return tv
    }()
    
    private lazy var refreshControl:UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(self.reloadData(refreshControl:)), for: .valueChanged)
        return rc
    }()
    
    //MARK: - Init -
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavBar()
        self.setupViews()
        self.loadData()
    }
    
    func setupNavBar() {
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        guard let navBar = self.navigationController?.navigationBar else { return }
        
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.Text.darkGrey]
        navBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.Text.darkGrey]
        
        self.navigationItem.title = "Patrick Ngo" //TODO: fetch name from api
        
        if #available(iOS 11.0, *) {
            navBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setupViews() {
        
        //self.tableView.addSubview(self.refreshControl)
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    func loadData(reloadAll:Bool = false) {
        guard !self.isLoading else {
            return
        }
        
        //signal start loading
        self.isLoading = true
        
        
        ResumesAPI.getResume(by: 1) { (result, error) in
            if let result = result, error == nil {
                
                do {
                    let resumeResponse = try JSONDecoder().decode(ResumeModel.self, from: result)
                    
                    self.resume = resumeResponse
                    
                    //reload table
                    self.tableView.reloadData()
                }
                catch {
                    print("Error serializing json:", error)
                }
            }
            
            //signal end loading
            self.isLoading = false
            
            //stop refreshing
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
        }
        

    }
    
    @objc func reloadData(refreshControl:UIRefreshControl) {
        self.loadData(reloadAll:true)
    }
    
    //MARK: - TableView Datasource -
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.noOfSections.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case Section.header.rawValue,
             Section.about.rawValue,
             Section.contact.rawValue:
            return 1
        
        case Section.experience.rawValue:
            return 1
            
        case Section.education.rawValue:
            return 1
            
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case Section.header.rawValue:
            
            let headerCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: SingleResumeHeaderCell.self)) as! SingleResumeHeaderCell
            headerCell.resume = self.resume
            return headerCell
            
        case Section.about.rawValue:
             
             let aboutCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: SingleResumeAboutCell.self)) as! SingleResumeAboutCell
             aboutCell.resume = self.resume
             return aboutCell
            
        case Section.experience.rawValue,
             Section.education.rawValue,
             Section.contact.rawValue:
            
            let cell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))
            cell?.textLabel?.text = "cell"
            return cell!
            
        default:
            return UITableViewCell()
        }
    }
    
    
    //MARK: - TableView Delegate -
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do nothing
    }
    
    
}

