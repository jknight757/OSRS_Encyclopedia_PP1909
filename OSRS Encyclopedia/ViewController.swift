//
//  ViewController.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/10/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    // UI outlets
    @IBOutlet weak var tableView1: UITableView!
    
    // dictionary of data pulled from API
    var completeList: [String: ItemDetail] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = tabBarController as! TabBarViewController
        completeList = tabBar.apiData
        //print(completeList.count)
        
    }
   
    
    // conform to tableView delegate and set up tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let indexString = "\(indexPath.row)"
        let textOutput = completeList[indexString]?.name
        cell.textLabel?.text = textOutput

        return cell
    }
    
    @IBAction func button_click(_ sender: Any) {
        let tabBar = tabBarController as! TabBarViewController
        completeList = tabBar.apiData
        print(completeList.count)
      self.tableView1.reloadData()
    }

    
}

