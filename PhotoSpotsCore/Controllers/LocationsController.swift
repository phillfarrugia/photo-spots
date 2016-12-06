//
//  LocationsController.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation

public class LocationsController {
    
    public static let sharedInstance = LocationsController(locations: LocationsController.readLocalLocations())
    
    // MARK: Local Persistance
    
    private static let kLocationsStorageKey = "locations"
    
    public private(set) var locations: [Location] {
        didSet {
            LocalStorage.save(objects: locations, forKey: LocationsController.kLocationsStorageKey)
        }
    }
    
    private init(locations: [Location]) {
        self.locations = locations
    }
    
    private static func readLocalLocations() -> [Location] {
        if let existing = LocalStorage.read(objectsForKey: LocationsController.kLocationsStorageKey) {
            return existing as! [Location]
        }
        else {
            LocalStorage.save(objects: readDefaultLocations(), forKey: LocationsController.kLocationsStorageKey)
            return readLocalLocations()
        }
    }
    
    private static func readDefaultLocations() -> [Location] {
        if let frameworkBundle = Bundle(identifier: "com.phillfarrugia.PhotoSpotsCore"),
            let filePath = frameworkBundle.path(forResource: "locations", ofType: "json") {
            let defaultLocationsURL = URL(fileURLWithPath: filePath)
            if let defaultLocations = LocationsJSONSerializer.serializeLocations(withFilePathURL: defaultLocationsURL) {
                return defaultLocations
            }
        }
        return []
    }
    
    // MARK: Add Locations
    
    public func add(locations: [Location]) {
        self.locations.append(contentsOf: locations)
    }
    
    // MARK: Remove Locations
    
    public func remove(locations: [Location]) {
        self.locations = self.locations.filter {
            return !locations.contains($0)
        }
    }
    
}
