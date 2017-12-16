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
        
        tv.delegate = self
        tv.dataSource = self
        
        //cell registration
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
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        
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
        //TODO: load from api
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
        case Section.header.rawValue:
            return 1
        
        case Section.about.rawValue:
            return 1
        
        case Section.experience.rawValue:
            return 1
            
        case Section.education.rawValue:
            return 1
            
        case Section.about.rawValue:
            return 1
            
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))
        
        var name = ""
        
        switch indexPath.section {
        case Section.header.rawValue:
            name = Section.header.name()
            
        case Section.about.rawValue:
            name = Section.about.name()
            
        case Section.experience.rawValue:
            name = Section.experience.name()
            
        case Section.education.rawValue:
            name = Section.education.name()
            
        case Section.about.rawValue:
            name = Section.about.name()
            
        default:
            break
        }
        cell?.textLabel?.text = name
        
        return cell!
    }
    
    
    //MARK: - TableView Delegate -
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do nothing
    }
    
    
}
