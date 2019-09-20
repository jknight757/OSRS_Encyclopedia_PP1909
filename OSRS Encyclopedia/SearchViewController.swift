//
//  SearchViewController.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/14/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // UI Outlets
    @IBOutlet weak var SearchTableView: UITableView!
    @IBOutlet weak var SearchBar: UITextField!
    
    // Dictionaries, Itemlist stores items pulled from API, searchResults stores items with searched name
    var itemList: [String: ItemDetail] = [:]
    var searchResults: [ItemDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // access tab bar view controller and pull dictionary of items
        let tabBar = tabBarController as! TabBarViewController
        itemList = tabBar.apiData
        print(itemList.count)
    }
    /*
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! TabBarViewController
        itemList = tabBar.apiData
        print(itemList.count)
    }
 */
    //configure tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    // configure tableView, sets cells equal to results found in search (searchResults)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        if searchResults.count != 0{
            let textName = searchResults[indexPath.row].name
            let textCost = searchResults[indexPath.row].cost
            let textHolder = String(textName) + "  \(textCost!)"
            cell.textLabel?.text = textHolder
        
                
        }else{
            print("Error")
            }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowSearchDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedVC = segue.destination as? SearchItemDetailVC else {return}
        selectedVC.selectedItem = searchResults[(SearchTableView.indexPathForSelectedRow?.row)!]
        SearchTableView.deselectRow(at: SearchTableView.indexPathForSelectedRow!, animated: true)
    }
    // searches through itemList upon button click, adds results to searchResults dictionary
    @IBAction func searchClicked(_ sender: Any) {
        let tabBar = tabBarController as! TabBarViewController
        itemList = tabBar.apiData
        searchResults = []
        for (index, value) in itemList{
            if let itemName = SearchBar.text{
                if value.name.contains(itemName) || value.name == itemName{
                    searchResults.append(value)
                    print(value)
                }
            }
            else{
                
            }
           
        }
        // reload tableView data and display dictionary counts
        self.SearchTableView.reloadData()
        print(searchResults.count)
        print(itemList.count)
        
    }
    //
    
    
}
