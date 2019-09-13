//
//  ViewController.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/10/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let mockList = ["item1","item2","item3","item4","item5","item6","item7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize URL, set up session, pull data with a dataTask, run decoder
        guard let url = URL(string: "https://www.osrsbox.com/osrsbox-db/items-complete.json") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do{
                let item = try JSONDecoder().decode([String: ItemDetail].self, from: data)
//                print(item.count)
                /*for (index, value) in item{
                    print(value.name)
                }
 */
                
            }catch{
                print(error)
            }
        }
            task.resume()
    }
    
    // conform to tableView delegate and set up tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = mockList[indexPath.row]
        return cell
    }
    @IBAction func button_click(_ sender: Any) {
      
    }
    
}

