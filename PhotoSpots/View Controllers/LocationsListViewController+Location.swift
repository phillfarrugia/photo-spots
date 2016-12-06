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
        if let viewModels = self.viewModels {
            self.viewModels = locationHandler.viewModelsWithDistance(fromUserLocation: location, toViewModels: viewModels)
        }
    }
    
    func locationHandlerFailed(withError error: Error) {
        handleLocationUpdateError()
    }
    
}
