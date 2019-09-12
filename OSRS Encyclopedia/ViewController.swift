//
//  ViewController.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/10/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import UIKit

// using the varaible names from the api, the json can easily be decoded
struct Item: Decodable {
    let id: String
    let name: String
    
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let mockList = ["item1","item2","item3","item4","item5","item6","item7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize url string and cast to type URL
        let jsonUrlString = "https://www.osrsbox.com/osrsbox-db/items-summary.json"
        guard let url = URL(string: jsonUrlString) else {
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {
                return
            }
            
/*          do{
                let item = try JSONDecoder().decode(Item.self, from: data)
                print(item.name)
            }
            catch let jsonErr {
                print("Error serializing json:", jsonErr)
                
            }
 */
            let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString)
        }.resume()
        // Do any additional setup after loading the view.
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

