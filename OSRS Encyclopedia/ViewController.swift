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
        savedItems = tabBar.savedItems
        //print(completeList.count)
        
    }
   
    
    // configure tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedItems.count
    }
    // configure tableView, set cells equal to items found in saved item list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SavedItemTableViewCell
        let textOutput = savedItems[indexPath.row].name
        cell.iconLabel.text = textOutput

        return cell
    }
    // perform segue to detailVC passing cell data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowSavedItemDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let selectedVC = segue.destination as? SavedItemDetailVC else {return}
        selectedVC.selectedItem = savedItems[(tableView1.indexPathForSelectedRow?.row)!]
        tableView1.deselectRow(at: tableView1.indexPathForSelectedRow!, animated: true)
    }
    // load saved item list, reload tableView data
    @IBAction func button_click(_ sender: Any) {
        let tabBar = tabBarController as! TabBarViewController
        completeList = tabBar.apiData
        savedItems = tabBar.savedItems
        print(savedItems.count)
      self.tableView1.reloadData()
    }

    
}

