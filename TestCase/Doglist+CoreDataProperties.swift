//
//  DogList+CoreDataProperties.swift
//  DataModel
//
//  Created by Gun young Won on 2017. 6. 5..
//  Copyright © 2017년 Gun young Won. All rights reserved.
//

import Foundation
import CoreData


extension Doglist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Doglist> {
        return NSFetchRequest<Doglist>(entityName: "Doglist");
    }

    @NSManaged public var age: Int
    @NSManaged public var name: String
    @NSManaged public var picture: Data
    @NSManaged public var weight: Float
    @NSManaged public var vac_1: Bool
    @NSManaged public var vac_2: Bool
    @NSManaged public var vac_3: Bool
    
    func setval(Name:String, Age:Int, Weight:Float, Pic:Data){
        self.name = Name
        self.age = Int(Age)
        self.weight = Weight
        self.picture = Pic
        self.vac_1 = false
        self.vac_2 = false
        self.vac_3 = false
    }

}
