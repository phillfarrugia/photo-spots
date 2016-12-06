//
//  LocationsJSONSerializer.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation

internal class LocationsJSONSerializer {
    
    private static let kLocationsDictKey = "locations"
    
    internal static func serializeLocations(withFilePathURL url: URL) -> [Location]? {
        do {
            let data = try Data(contentsOf: url)
            if let jsonDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject] {
                return LocationsJSONSerializer.serializeLocations(withJSONDict: jsonDict)
            }
        }
        catch let error {
            print("\(error)")
        }
        return nil
    }
    
    internal static func serializeLocations(withJSONDict jsonDict: [String: AnyObject]) -> [Location]? {
        if let locationsArray = jsonDict["locations"] as? [[String: AnyObject]] {
            return locationsArray.map {
                return Location(jsonDict: $0)
            }.flatMap { $0 }
        }
        return nil
    }
    
}
