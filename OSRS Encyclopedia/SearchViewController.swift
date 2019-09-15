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
    
    @IBOutlet weak var SearchTableView: UITableView!
    @IBOutlet weak var SearchBar: UITextField!
    
    var itemList: [String: ItemDetail] = [:]
    var searchResults:[String: ItemDetail] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = tabBarController as! TabBarViewController
        itemList = tabBar.apiData
        print(itemList.count)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let indexString = "\(indexPath.row)"
        if searchResults.count != 0{
        if let textName = searchResults[indexString]?.name{
                if let textCost = searchResults[indexString]?.cost{
                    let textHolder = String(textName) + "  "+String(textCost)
                    cell.textLabel?.text = textHolder
                }
            }else{
                print("Error unwrapping \(searchResults[indexString]?.name)")
            }
        }
        
        
        
        return cell
    }
    @IBAction func searchClicked(_ sender: Any) {
        searchResults = [:]
        for (index, value) in itemList{
            if let itemName = SearchBar.text{
                if value.name.contains(itemName) || value.name == itemName{
                    searchResults.updateValue(value, forKey: index)
                    print(value.name)
                    print(value)
                    
                }
            }
            else{
                
            }
           
        }
        self.SearchTableView.reloadData()
        print(searchResults.count)
        print(itemList.count)
        
    }
    
}
