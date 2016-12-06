//
//  LocationsListCellViewModel.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation

public struct LocationsListCellViewModel {
    
    private let location: Location
    
    public var title: String {
        return location.name
    }
    
    public var distance: String {
        return "10km away"
    }
    
    public init(location: Location) {
        self.location = location
    }
    
}
