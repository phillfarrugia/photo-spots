//
//  UserLocationHandler.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation
import CoreLocation

public protocol UserLocationHandlerDelegate {
    func locationHandlerDidUpdateLocation(location: CLLocation)
    func locationHandlerFailed(withError error: Error)
}

public class UserLocationHandler: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    
    public var delegate: UserLocationHandlerDelegate?
    
    public func requestPermissions() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    public func requestOneTimeLocationUpdate() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation()
    }
    
    // MARK: CLLocationManagerDelegate
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let delegate = self.delegate , let location = locations.first {
            delegate.locationHandlerDidUpdateLocation(location: location)
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let delegate = self.delegate {
            delegate.locationHandlerFailed(withError: error)
        }
    }
    
    public func viewModelsWithDistance(fromUserLocation userLocation: CLLocation, toViewModels viewModels: [LocationsListCellViewModel]) -> [LocationsListCellViewModel] {
        return viewModels.map {
            let distanceFromUser = userLocation.distance(from: CLLocation(latitude: $0.location.latitude, longitude: $0.location.longitude))
            return LocationsListCellViewModel(location: $0.location, distanceFromUser: distanceFromUser)
        }
    }
}
