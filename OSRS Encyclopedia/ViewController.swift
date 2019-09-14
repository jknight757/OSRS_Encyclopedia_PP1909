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
        
        // initialize URL, set up session, pull data with a dataTask, run decoder
        guard let url = URL(string: "https://www.osrsbox.com/osrsbox-db/items-complete.json") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do{
                // data pulled is decoded then saved to completeList
                let item = try JSONDecoder().decode([String: ItemDetail].self, from: data)
                print(item.count)
                for (index, value) in item{
                    print(value.name)
                }
                self.completeList = item
                
            }catch{
                print(error)
            }
        }
            task.resume()
        
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
      self.tableView1.reloadData()
    }
    
}

