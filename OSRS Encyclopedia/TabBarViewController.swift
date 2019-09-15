//
//  TabBarViewController.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/14/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var apiData: [String: ItemDetail] = [:]
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
                
                for (_, value) in item{
                    //print(value.name)
                }
                self.apiData = item
                print(self.apiData.count)
                
            }catch{
                print(error)
            }
        }
        task.resume()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
