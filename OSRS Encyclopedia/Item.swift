//
//  Item.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/11/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

// this class encapsulates all of the data structure retrived from the API and makes it decodable
import Foundation

struct ItemDetail: Codable{
    var id: Int
    var name: String
    var members: Bool
    var tradeable: Bool
    var tradeable_on_ge: Bool
    var stackable: Bool
    var noted: Bool?
    var noteable: Bool?
    var linked_id_item: Int?
    var linked_id_noted: Int?
    var linked_id_placeHolder: Int?
    var placeholder: Bool?
    var equipable: Bool?
    var equipable_by_player: Bool?
    var equipable_weapon: Bool?
    var cost: Int?
    var lowalch: Int?
    var highalch: Int?
    var weight: Double?
    var buy_limit: Int?
    var quest_item: Bool?
    var release_date: String?
    var duplicate: Bool?
    var examine: String?
    var wiki_name: String?
    var wiki_url: String?
    var equipment: equipmentInfo?
    var weapon:  weaponInfo?
    
    init(id: Int, name: String, members: Bool, tradeable: Bool, tradeable_on_ge: Bool, stackable: Bool, noted: Bool?, noteable: Bool?,  linked_id_item: Int?, linked_id_noted: Int?, linked_id_placeHolder: Int?, placeholder: Bool?, equipable: Bool?, equipable_by_player: Bool?, equipable_weapon: Bool?, cost: Int?, lowalch: Int?, highalch: Int?, weight: Double?, buy_limit: Int?, quest_item: Bool?, release_date: String?, duplicate: Bool?, examine: String?, wiki_name: String?, wiki_url: String?, equipment: equipmentInfo?, weapon:  weaponInfo?){
        
         self.id = id
         self.name = name
         self.members = members
         self.tradeable = tradeable
         self.tradeable_on_ge = tradeable_on_ge
         self.stackable = stackable
         self.noted = noted
         self.noteable = noteable
         self.linked_id_item = linked_id_item
         self.linked_id_noted = linked_id_noted
         self.linked_id_placeHolder = linked_id_placeHolder
         self.placeholder = placeholder
         self.equipable = equipable
         self.equipable_by_player = equipable_by_player
         self.equipable_weapon = equipable_weapon
         self.cost = cost
         self.lowalch = lowalch
         self.highalch = highalch
         self.weight = weight
         self.buy_limit = buy_limit
         self.quest_item = quest_item
         self.release_date = release_date
         self.duplicate = duplicate
         self.examine = examine
         self.wiki_name = wiki_name
         self.wiki_url = wiki_url
         self.equipment = equipment
         self.weapon = weapon
        
        
    }
    
}
// child node of equipment
struct equipmentInfo: Codable{
    var attack_stab: Int?
    var attack_slash: Int?
    var attack_crush: Int?
    var attack_magic: Int?
    var attack_ranged: Int?
    var defence_stab: Int?
    var defence_slash: Int?
    var defence_crush: Int?
    var defence_magic: Int?
    var defence_ranged: Int?
    var melee_strength: Int?
    var ranged_strength: Int?
    var magic_damage: Int?
    var prayer: Int?
    var slot: String?
    var requirements: [String: Int?]?
    
    
}

// child data of itemDetail pulled
struct weaponInfo: Codable{
    var attack_speed: Int?
    var weapon_type: String?
    var stances: [stancesInfo?]
    
}

// child data of equipmentInfo pulled
// these are the skill level requirements to use the item
struct itemRequirements: Codable{
    var attack: Int?
    var strength: Int?
    var defence: Int?
    var hitpoints: Int?
    var ranged: Int?
    var prayer: Int?
    var magic: Int?
    var cooking: Int?
    var woodcutting: Int?
    var fletching: Int?
    var fishing: Int?
    var firemaking: Int?
    var crafting: Int?
    var smithing: Int?
    var mining: Int?
    var herblore: Int?
    var agility: Int?
    var theifing: Int?
    var slayer: Int?
    var farming: Int?
    var runecrafting: Int?
    var hunter: Int?
    var construction: Int?
    
    
}
// child data of weaponInfo
struct stancesInfo: Codable{
    var combatStyle: String?
    var attackType: String?
    var attackStyle: String?
    var experience: String?
    var boosts: String?
}



