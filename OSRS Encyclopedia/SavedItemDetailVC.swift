//
//  SavedItemDetailVC.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/17/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import UIKit

class SavedItemDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TitleLabel: UILabel!
    
    var selectedItem: ItemDetail?
    var savedItems: [ItemDetail]? = []
    var itemAttributes: [String] = []
    var updatedItems: [String: ItemDetail] = [:]
    var updatedValue: [String: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = tabBarController as! TabBarViewController
        savedItems = tabBar.savedItems
        TitleLabel.text = selectedItem?.name
        
        // if the value has been updated and clicked remove it from updated list
        for (_, value) in updatedItems{
            if value.id == selectedItem?.id{
                let alert = UIAlertController(title: "\(String(describing: selectedItem?.name))'s price changed", message: "The price of \(String(describing: selectedItem?.name)) changed by \(String(describing: updatedValue["\(String(describing: selectedItem?.id))"]))", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                updatedItems.removeValue(forKey: "\(String(describing: selectedItem?.id))")
            }
        }
        // adds item attributes to itemAttributes array
        itemAttributes.append("ID:   \(selectedItem!.id)")
        itemAttributes.append("Name:   \(selectedItem!.name)")
        itemAttributes.append("Members:   \(selectedItem!.members)")
        itemAttributes.append("Tradeable:   \(selectedItem!.tradeable)")
        itemAttributes.append("Tradeable on GE:   \(selectedItem!.tradeable_on_ge)")
        itemAttributes.append("Stackable:   \(selectedItem!.stackable)")
        
        // checks if item attributes are null then adds appropriate attribute to array
        if selectedItem?.noted != nil{
            //itemAttributes.append("Noted:   \(selectedItem!.noted!)")
        }else{ //itemAttributes.append("Noted: ")
            
        }
        if selectedItem?.noteable != nil{
            itemAttributes.append("Noteable:   \(selectedItem!.noteable!)")
        }else{ itemAttributes.append("Noteable:")}
        if selectedItem?.linked_id_item != nil{
            //itemAttributes.append("Linked Id item:   \(selectedItem!.linked_id_item!)")
        }else{ //itemAttributes.append("Linked Id item:")
            
        }
        if selectedItem?.linked_id_noted != nil{
            //itemAttributes.append("Linked Id noted:   \(selectedItem!.linked_id_noted!)")
        }else{ //itemAttributes.append("Linked Id noted:")
            
        }
        if selectedItem?.linked_id_placeHolder != nil{
            //itemAttributes.append("Linked Id placeholder:   \(selectedItem!.linked_id_placeHolder!)")
        }else{ //itemAttributes.append("Linked Id placeholder:")
            
        }
        if selectedItem?.placeholder != nil{
            //itemAttributes.append("Placeholder:   \(selectedItem!.placeholder!)")
        }else{ //itemAttributes.append("Placeholder:")
            
        }
        if selectedItem?.equipable != nil{
            itemAttributes.append("Equipable:   \(selectedItem!.equipable!)")
        }else{ itemAttributes.append("Equipable:")}
        if selectedItem?.equipable_by_player != nil{
            itemAttributes.append("Equipable by player:   \(selectedItem!.equipable_by_player!)")
        }else{ itemAttributes.append("Equipable by player:")}
        if selectedItem?.equipable_weapon != nil{
            itemAttributes.append("Equipable weapon:   \(selectedItem!.equipable_weapon!)")
        }else{ itemAttributes.append("Equipable weapon:")}
        if selectedItem?.cost != nil{
            itemAttributes.append("Cost:   \(selectedItem!.cost!)")
        }else{ itemAttributes.append("Cost:")}
        if selectedItem?.lowalch != nil{
            itemAttributes.append("Lowalch:   \(selectedItem!.lowalch!)")
        }else{ itemAttributes.append("Lowalch:")}
        if selectedItem?.highalch != nil{
            itemAttributes.append("Highalch:   \(selectedItem!.highalch!)")
        }else{ itemAttributes.append("Highalch:")}
        if selectedItem?.weight != nil{
            itemAttributes.append("Weight:   \(selectedItem!.weight!)")
        }else{ //itemAttributes.append("Weight:")
            
        }
        if selectedItem?.buy_limit != nil{
            itemAttributes.append("Buy limit:   \(selectedItem!.buy_limit!)")
        }else{ //itemAttributes.append("Buy limit:")
            
        }
        if selectedItem?.quest_item != nil{
            itemAttributes.append("Quest item:   \(selectedItem!.quest_item!)")
        }else{ itemAttributes.append("Quest item:")}
        if selectedItem?.release_date != nil{
            itemAttributes.append("Release date:   \(selectedItem!.release_date!)")
        }else{ itemAttributes.append("Release date:")}
        if selectedItem?.duplicate != nil{
            //itemAttributes.append("Duplicate:   \(selectedItem!.duplicate!)")
        }else{ //itemAttributes.append("Duplicate:")
            
        }
        if selectedItem?.examine != nil{
            itemAttributes.append("Examine:   \(selectedItem!.examine!)")
        }else{ itemAttributes.append("Examine:")}
        if selectedItem?.wiki_name != nil{
            //itemAttributes.append("Wiki name:   \(selectedItem!.wiki_name!)")
        }else{ //itemAttributes.append("Wiki name:")
            
        }
        if selectedItem?.wiki_url != nil{
            itemAttributes.append("Wiki URL:   \(selectedItem!.wiki_url!)")
        }else{ itemAttributes.append("Wiki URL:")}
        if selectedItem?.equipment != nil{
            //itemAttributes.append("Equipment")
        }else{//itemAttributes.append("Equipment:")
            
        }
        
        
        if selectedItem?.weapon != nil{
            if selectedItem?.weapon?.attack_speed != nil{
                itemAttributes.append("Attack speed:   \(selectedItem!.weapon!.attack_speed!)")
            }else{ itemAttributes.append("Attack speed:")}
            if selectedItem?.weapon?.weapon_type != nil{
                itemAttributes.append("Weapon type:   \(selectedItem!.weapon!.weapon_type!)")
            }else{ itemAttributes.append("Weapon type:")}
            if selectedItem?.weapon?.stances != nil{
                if (selectedItem?.weapon?.stances.count)! >= 1{
                    if selectedItem?.weapon?.stances[0]?.combatStyle != nil{
                        itemAttributes.append("Combat style:   \(String(describing: selectedItem!.weapon!.stances[0]?.combatStyle!))")
                    }else{ itemAttributes.append("Combat style:")}
                }
                if (selectedItem?.weapon?.stances.count)! >= 2{
                    if selectedItem?.weapon?.stances[1]?.attackType != nil{
                        itemAttributes.append("Attack type:   \(String(describing: selectedItem!.weapon!.stances[1]?.attackType!))")
                    }else{ itemAttributes.append("Attack type:")}
                }
                if (selectedItem?.weapon?.stances.count)! >= 3{
                    if selectedItem?.weapon?.stances[2]?.attackStyle != nil{
                        itemAttributes.append("Attack style:   \(String(describing: selectedItem!.weapon!.stances[2]?.attackStyle!))")
                    }else{ itemAttributes.append("Attack style:")}
                }
                if (selectedItem?.weapon?.stances.count)! >= 4{
                    if selectedItem?.weapon?.stances[3]?.experience != nil{
                        itemAttributes.append("Experience:   \(String(describing: selectedItem!.weapon!.stances[3]?.experience!))")
                    }else{ itemAttributes.append("Experience:")}
                }
                if (selectedItem?.weapon?.stances.count)! >= 5{
                    if selectedItem?.weapon?.stances[4]?.boosts != nil{
                        itemAttributes.append("Boosts:   \(String(describing: selectedItem!.weapon!.stances[4]?.boosts!))")
                    }else{ itemAttributes.append("Boosts:")}
                }
                
            }else{ itemAttributes.append("Stances:")}
            
        }else{ //itemAttributes.append("Weapon:")
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemAttributes.count
    }
    // configure tableView, sets cells equal to results found in search (searchResults)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = itemAttributes[indexPath.row]
        return cell
    }
    
    // checks if item is in list, if it is then the item is removed and user is alerted
    // if the item isnt in the list then display alert
    // saved redacted item list to tab bar controller
    @IBAction func RemoveItemButtonClicked(_ sender: Any) {
        let tabBar = tabBarController as! TabBarViewController
        savedItems = tabBar.savedItems
        var deleted = false
        if savedItems!.count > 0 {
            var x = 0
            for item in savedItems!{
                if selectedItem!.id == item.id{
                    
                    let alert = UIAlertController(title: "Item removed", message: "The selected item has been removed from your item list.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    deleted = true
                    let tabBar = tabBarController as! TabBarViewController
                    let RI = tabBar.saveStrings[x]
                    PersistenceService.context.delete(RI)
                    tabBar.saveStrings.remove(at: x)
                    PersistenceService.saveContext()
                    savedItems?.remove(at: x)
                    tabBar.savedItems = savedItems!
                    break
                }
                x += 1
            }
            if !deleted{
                let alert = UIAlertController(title: "Item already removed", message: "The selected item has already been removed from your item list.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }else{
                let tabBar = tabBarController as! TabBarViewController
                tabBar.savedItems = savedItems!
            }
        }
    }
}
