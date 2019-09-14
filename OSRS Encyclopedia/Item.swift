//
//  Item.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/11/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

// this class encapsulates all of the data retrived from the API to be decoded
import Foundation
/*
struct ItemDetail: Decodable{
    var id: Int
    var name: String
}
*/
struct ItemDetail: Decodable{
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
}
// child node of equipment
struct equipmentInfo: Decodable{
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
struct weaponInfo: Decodable{
    var attack_speed: Int?
    var weapon_type: String?
    var stances: [stancesInfo]?
    
}

// child data of equipmentInfo pulled
// these are the skill level requirements to use the item
struct itemRequirements: Decodable{
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
struct stancesInfo: Decodable{
    var combatStyle: String?
    var attackType: String?
    var attackStyle: String?
    var experience: String?
    var boosts: String?
}



