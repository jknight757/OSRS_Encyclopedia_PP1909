//
//  ViewController.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/10/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import UIKit
import CoreData
// Home/saved item view controller

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    // UI outlets
    @IBOutlet weak var tableView1: UITableView!

    
    // locally stored data, all items pulled from api and all items saved by user
    var completeList: [String: ItemDetail] = [:]
    var savedItems: [ItemDetail] = []
    var updatedItems: [String: ItemDetail] = [:]
    var updatedValue: [String: Int] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // get data from tab bar controller
        let tabBar = tabBarController as! TabBarViewController
        completeList = tabBar.apiData
        savedItems = tabBar.savedItems
        
        // checks if prices changed, holds chnaged values in list
        for (key, value) in completeList{
            for items in savedItems{
                if value.name == items.name{
                    if value.cost != items.cost{
                        let gain = value.cost! - items.cost!
                        updatedItems[key] = value
                        updatedValue[key] = gain
                    }
                }
            }
        }
        
        
    }
    // update saved items list and table view
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! TabBarViewController
        savedItems = tabBar.savedItems
        self.tableView1.reloadData()
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
      
        if savedItems[indexPath.row].cost! <= 1{

            let imgTemp = resizeImage(image: UIImage(named: "Coins_3")!, targetSize: CGSize.init(width: 20, height: 20))
            cell.iconImage.image = imgTemp

        } else if savedItems[indexPath.row].cost! <= 50{
            cell.iconImage.image = UIImage(named: "Coins_5")
        } else if savedItems[indexPath.row].cost! <= 1000{
            cell.iconImage.image = UIImage(named: "Coins_100")
        } else if savedItems[indexPath.row].cost! <= 10000{
            cell.iconImage.image = UIImage(named: "Coins_250")
        } else{
            cell.iconImage.image = UIImage(named: "Coins_1000")
        }
        for (_, value) in updatedItems{
            if value.id == savedItems[indexPath.row].id{
                cell.iconImage.image = UIImage(named: "notification")
            }
        }
        
        return cell
    }
    // perform segue to detailVC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowSavedItemDetail", sender: self)
    }
    // pass cell data to detailVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let selectedVC = segue.destination as? SavedItemDetailVC else {return}
        selectedVC.selectedItem = savedItems[(tableView1.indexPathForSelectedRow?.row)!]
        selectedVC.updatedValue = updatedValue
        selectedVC.updatedItems = updatedItems
        tableView1.deselectRow(at: tableView1.indexPathForSelectedRow!, animated: true)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    

    
}

