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
    var savedItems: [ItemDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = tabBarController as! TabBarViewController
        completeList = tabBar.apiData
        //print(completeList.count)
        
    }
   
    
    // configure tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeList.count
    }
    // configure tableView, set cells equal to items found in saved item list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SavedItemTableViewCell
        let indexString = "\(indexPath.row)"
        let textOutput = completeList[indexString]?.name
        cell.iconLabel.text = textOutput

        return cell
    }
    // perform segue to detailVC passing cell data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowSavedItemDetail", sender: self)
    }
    
    // load saved item list, reload tableView data
    @IBAction func button_click(_ sender: Any) {
        let tabBar = tabBarController as! TabBarViewController
        completeList = tabBar.apiData
        print(completeList.count)
      self.tableView1.reloadData()
    }

    
}

