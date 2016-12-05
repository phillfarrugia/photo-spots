//
//  LocationsController.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation

class LocationsController {
    
    static let sharedInstance = LocationsController(locations: LocationsController.readLocalLocations())
    
    // MARK: Local Persistance
    
    static let kLocationsStorageKey = "locations"
    
    private(set) var locations: [Location]
    
    init(locations: [Location]) {
        self.locations = locations
    }
    
    static func readLocalLocations() -> [Location] {
        if let existing = LocalStorage.read(objectsForKey: LocationsController.kLocationsStorageKey) {
            return existing as! [Location]
        }
        else {
            LocalStorage.save(objects: [], forKey: LocationsController.kLocationsStorageKey)
            return readLocalLocations()
        }
    }
    
    // MARK: Add Locations
    
    func add(locations: [Location]) {
        self.locations.append(contentsOf: locations)
    }
    
    // MARK: Remove Locations
    
    func remove(locations: [Location]) {
        self.locations = self.locations.filter {
            return !locations.contains($0)
        }
    }
    
}
