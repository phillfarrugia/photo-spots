//
//  LocationsListViewController+Location.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation
import CoreLocation

extension LocationsListViewController {
    
    // MARK: UserLocationHandlerDelegate
    
    func locationHandlerDidUpdateLocation(location: CLLocation) {
        print("Did update location")
    }
    
    func locationHandlerFailed(withError error: Error) {
        print("error")
    }
    
}
