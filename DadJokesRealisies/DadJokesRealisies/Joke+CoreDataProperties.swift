//
//  Joke+CoreDataProperties.swift
//  DadJokesRealisies
//
//  Created by Felix Lin on 9/23/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var rating: String
    @NSManaged public var punchline: String
    @NSManaged public var setup: String

}
