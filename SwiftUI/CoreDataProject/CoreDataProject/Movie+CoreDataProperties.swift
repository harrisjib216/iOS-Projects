//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by jibril harris on 7/11/25.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    var wrappedTitle: String {
        title ?? "Unkown movie"
    }
    
    var wrappedDirector: String {
        title ?? "Unkown director"
    }
}

extension Movie : Identifiable {

}
