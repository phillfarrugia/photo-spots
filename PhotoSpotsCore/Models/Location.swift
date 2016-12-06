//
//  Location.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation

public class Location: NSObject, NSCoding {
    
    public let name: String
    
    public let latitude: Double
    public let longitude: Double
    
    public let notes: String?
    
    public init(name: String, latitude: Double, longitude: Double, notes: String? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.notes = notes
    }
    
    public init?(jsonDict: [String: AnyObject]) {
        let notes = jsonDict["notes"] as? String
        guard let name = jsonDict["name"] as? String,
            let latitude = jsonDict["lat"] as? Double,
            let longitude = jsonDict["lng"] as? Double else {
                return nil
        }
        
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.notes = notes
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        guard let rhs = object as? Location else {
            return false
        }
        let lhs = self
        return lhs.name == rhs.name
    }
    
    // MARK: NSCoding
    
    required convenience public init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String else { return nil }
        let longitude = aDecoder.decodeDouble(forKey: "longitude")
        let latitude = aDecoder.decodeDouble(forKey: "latitude")
        let notes = aDecoder.decodeObject(forKey: "notes") as? String
        self.init(name: name, latitude: latitude, longitude: longitude, notes: notes)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(latitude, forKey: "latitude")
        aCoder.encode(longitude, forKey: "longitude")
        aCoder.encode(notes, forKey: "notes")
    }
    
}
