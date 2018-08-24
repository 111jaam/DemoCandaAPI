//
//  CanadaListViewController.swift
//  DemoCanadaAPI
//
//  Created by Bharat Byan on 10/08/18.
//  Copyright © 2018 Bharat Byan. All rights reserved.
//

import UIKit
import SwiftyJSON

class CanadaListViewController: UIViewController {
    
    var viewModelCanada: [ViewModelCanada] = []
    let tblCanada = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Canada API's"
        updateUI()
        callAPI()
    }
    
    func callAPI(){
        viewModelCanada = []
        ManagerCanadaList.sharedInstance.delegateManager = self
        ManagerCanadaList.sharedInstance.createRequest()
    }
    
    func updateUI(){
        tblCanada.frame = CGRect(x: 0, y: 0, width: 320, height: 500)
        tblCanada.dataSource = self
        tblCanada.delegate = self
        tblCanada.register(CanadaTableCell.self, forCellReuseIdentifier: "cellCanada")
        
        tblCanada.rowHeight = UITableView.automaticDimension
        tblCanada.estimatedRowHeight = 100.0
        
        self.view.addSubview(tblCanada)
        
        //TableView Constraints
        tblCanada.translatesAutoresizingMaskIntoConstraints = false
        tblCanada.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tblCanada.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tblCanada.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tblCanada.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension CanadaListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelCanada.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCanada") as! CanadaTableCell
        cell.imgThumbnail.image = UIImage.init(named: "imgThumbnail")
        cell.lblTitle.text = viewModelCanada[indexPath.row].title
        cell.lblDescription.text = viewModelCanada[indexPath.row].description
        
        return cell
    }
}

extension CanadaListViewController: ManagerCanadaListProtocol {
    func sendData(arrayOfViewModel: Array<ViewModelCanada>) {
        
        viewModelCanada = arrayOfViewModel
        tblCanada.reloadData()
    }
}


//
// MARK :- CELL
//
class CanadaTableCell: UITableViewCell {
    
    var imgThumbnail = UIImageView()
    var lblTitle = UILabel()
    var lblDescription = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        updateUI()
        contentView.backgroundColor = .white
    }
    
    func updateUI() {
        imgThumbnail.frame = CGRect(x: 5, y: 5, width: 75, height: 75)
        lblTitle.frame = CGRect(x: 85, y: 5, width: 230, height: 30)
        lblDescription.frame = CGRect(x: 85, y: 40, width: 230, height: 55)
        
//        lblTitle.frame = CGRect(x: 0, y: 5, width: 230, height: 30)
//        lblDescription.frame = CGRect(x: 0, y: 40, width: 230, height: 55)
        
        lblTitle.numberOfLines = 1
//        lblTitle.backgroundColor = UIColor.red
        
        lblDescription.numberOfLines = 0
        lblDescription.font = UIFont(name: "Avenir-Book", size: 12)
        lblDescription.textColor = UIColor.lightGray
//        lblDescription.backgroundColor = UIColor.yellow
        lblDescription.textAlignment = .left
        
        
        let marginGuide = contentView.layoutMarginsGuide
        
        self.contentView.addSubview(imgThumbnail)
        self.contentView.addSubview(lblTitle)
        self.contentView.addSubview(lblDescription)
        
        //lblTitle Constraints
        imgThumbnail.translatesAutoresizingMaskIntoConstraints = false
        imgThumbnail.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        imgThumbnail.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
//        imgThumbnail.addConstraint(NSLayoutConstraint(item: imgThumbnail,
//                                                      attribute: NSLayoutConstraint.Attribute.height,
//                                                      relatedBy: NSLayoutConstraint.Relation.equal,
//                                                        toItem: imgThumbnail,
//                                                        attribute: NSLayoutConstraint.Attribute.width,
//                                                        multiplier: imgThumbnail.frame.size.height / imgThumbnail.frame.size.width,
//                                                        constant: 0))
//        imgThumbnail.trailingAnchor.constraint(equalTo: lblTitle.leadingAnchor).isActive = true
//        imgThumbnail.trailingAnchor.constraint(equalTo: lblDescription.leadingAnchor, constant: -5.0).isActive = true
        imgThumbnail.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
        imgThumbnail.widthAnchor.constraint(equalToConstant: 75.0).isActive = true
        imgThumbnail.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor).isActive = true
        
        //lblTitle Constraints
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        lblTitle.trailingAnchor.constraint(greaterThanOrEqualTo: marginGuide.trailingAnchor).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo: lblDescription.leadingAnchor).isActive = true
        lblTitle.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        
        
        //lblDescription Constraints
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor).isActive = true
        lblDescription.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 85.0).isActive = true
        lblDescription.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor, constant: 5.0).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        lblDescription.setContentHuggingPriority(.init(rawValue: 100), for: .vertical)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
