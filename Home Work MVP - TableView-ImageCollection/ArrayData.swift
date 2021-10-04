//
//  ArrayData+CoreDataClass.swift
//  Home Work MVP - TableView-ImageCollection
//
//  Created by Vladislav Pashkevich on 3.10.21.
//
//

import Foundation
import CoreData

@objc(ArrayData)
public class ArrayData: NSManagedObject, Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArrayData> {
        return NSFetchRequest<ArrayData>(entityName: "ArrayData")
    }

    @NSManaged public var imageArrayData: NSData


}
