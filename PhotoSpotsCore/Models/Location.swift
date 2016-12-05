//
//  Location.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation

class Location: NSObject {
    
    let name: String
    
    let latitude: Double
    let longitude: Double
    
    let notes: String?
    
    init(name: String, latitude: Double, longitude: Double, notes: String? = nil) {
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
    
}
