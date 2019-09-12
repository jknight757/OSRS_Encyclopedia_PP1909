//
//  Item.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/11/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

// this class encapsulates all of the data retrived from the API to be decoded
import Foundation

struct Response: Decodable{
    var response:Items
}
struct Items: Decodable{
    var items: [ItemDetail]
}
struct ItemDetail: Decodable{
    var id: String
    var name: String
}
/*
struct ItemResponse:Decodable{
    var response:Items
}
struct Items:Decodable{
    var items: [itemDetail]
}
// primary data pulled
struct itemDetail: Decodable{
    var id: Int
    var name: String
    var members: Bool
    var tradeable: Bool
    var GeTradeable: Bool
    var stackable: Bool
    var noted: Bool
    var noteable: Bool
    var linkedIdItem: Int
    var linkedIdNoted: Int
    var linkedIdPlaceHolder: Int
    var placeHolder: Bool
    var equipable: Bool
    var equipableByPlayer: Bool
    var equipableWeapon: Bool
    var cost: Int
    var lowalch: Int
    var highalch: Int
    var weight: Double
    var buyLimit: Int
    var questItem: Bool
    var releaseDate: String
    var duplicate: Bool
    var examine: String
    var wikiName: String
    var wikiUrl: String
    var equipment: equipmentInfo
    var weapon: weaponInfo
}
// child data of itemDetail pulled
struct equipmentInfo: Decodable{
    var aStab: Int
    var aSlash: Int
    var aCrush: Int
    var aMagic: Int
    var aRanged: Int
    var dStab: Int
    var dSlash: Int
    var dCrush: Int
    var dMagic: Int
    var dRanged: Int
    var meleeStrength: Int
    var rangedStrength: Int
    var magicDamage: Int
    var prayer: Int
    var slot: String
    var requirements: itemRequirements
    
    
}
// child data of itemDetail pulled
struct weaponInfo: Decodable{
    var attackSpeed: Int
    var weaponType: String
    var stances: [stancesInfo]
    
}
// child data of equipmentInfo pulled
// these are the skill level requirements to use the item
struct itemRequirements: Decodable{
    var _attack: Int
    var _strength: Int
    var _defence: Int
    var _hitpoints: Int
    var _ranged: Int
    var _prayer: Int
    var _magic: Int
    var _cooking: Int
    var _woodcutting: Int
    var _fletching: Int
    var _fishing: Int
    var _firemaking: Int
    var _crafting: Int
    var _smithing: Int
    var _mining: Int
    var _herblore: Int
    var _agility: Int
    var _theifing: Int
    var _slayer: Int
    var _farming: Int
    var _runecrafting: Int
    var _hunter:Int
    var _construction: Int
    
    
}
// child data of weaponInfo
struct stancesInfo: Decodable{
    var combatStyle: String
    var attackType: String
    var attackStyle: String
    var experience: String
    var boosts: String
}
 */

