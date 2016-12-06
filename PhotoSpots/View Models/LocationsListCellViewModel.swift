//
//  LocationsListCellViewModel.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation

public struct LocationsListCellViewModel {
    
    internal let location: Location
    
    internal let distanceFromUser: Double?
    
    public var title: String {
        return location.name
    }
    
    public var distance: String? {
        if let distanceFromUser = self.distanceFromUser {
            return String(format: "%.2f km away", LocationsListCellViewModel.convertToKilometres(metres: distanceFromUser))
        }
        return "Calculating distance..."
    }
    
    public init(location: Location, distanceFromUser: Double? = nil) {
        self.location = location
        self.distanceFromUser = distanceFromUser
    }
    
    static func convertToKilometres(metres: Double) -> Double {
        return metres / 1000.0
    }
    
}
