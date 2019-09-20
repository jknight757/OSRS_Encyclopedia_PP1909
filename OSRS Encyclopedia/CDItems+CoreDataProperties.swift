//
//  CDItems+CoreDataProperties.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/20/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//
//

import Foundation
import CoreData


extension CDItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDItems> {
        return NSFetchRequest<CDItems>(entityName: "CDItems")
    }

    @NSManaged public var savedItemsString: String?

}
