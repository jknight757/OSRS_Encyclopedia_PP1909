//
//  TabBarViewController.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/14/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import UIKit
import CoreData

class TabBarViewController: UITabBarController {

    var apiData: [String: ItemDetail] = [:]
    var apiDataIcons: [UIImage]? = []
    var savedItems: [ItemDetail] = []
    var saveStrings:  [CDItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            // initialize core data object
        let fetchRequest: NSFetchRequest<CDItems> = CDItems.fetchRequest()
        do{
            let saveString = try PersistenceService.context.fetch(fetchRequest)
            self.saveStrings = saveString
        } catch{
            
        }
        
        
        /*print(saveStrings.count)
        for x in saveStrings{
            print("items \(x.savedItemsString)")
        }
        */
        if saveStrings.count != 0{
            for x in saveStrings{
                let d = x.savedItemsString?.data(using: .utf8)
                    do {
                        let instance = try JSONDecoder().decode(ItemDetail.self, from: d!)
                        savedItems.append(instance)
                    } catch{
                    
                    }
            }
        }
    
        
        
        
        // initialize URL, set up session, pull data with a dataTask, run decoder
        guard let url = URL(string: "https://www.osrsbox.com/osrsbox-db/items-complete.json") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do{
                // data pulled is decoded then saved to completeList
                let item = try JSONDecoder().decode([String: ItemDetail].self, from: data)
                self.apiData = item
                print(self.apiData.count)
                
                
            }catch{
                print(error)
            }
        }
        task.resume()
        
        
        
        // initialize URL, set up session, pull data with a dataTask, run decoder
        /*
        guard let iconUrl = URL(string: "https://www.osrsbox.com/osrsbox-db/item-icons/1.") else {return}
        let iconSession = URLSession.shared
        let iconTask = iconSession.dataTask(with: iconUrl) { (data, _, _) in
            guard let data = data else {return}
            do{
                let icons = try UIImage(data: data)
                //self.apiDataIcons = [icons] as! [UIImage]
                print(icons)
                
            }catch{
                print(error)
            }
        }
        iconTask.resume()
 */
        
    }

}
