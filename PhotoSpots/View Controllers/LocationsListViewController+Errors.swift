//
//  LocationsListViewController+Errors.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 7/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import UIKit

extension LocationsListViewController {
    
    internal func handleLocationUpdateError() {
        let alertController = UIAlertController(title: "Unable to update Location", message: "Uh oh, we're unable to calculate your location. Would you like to try again?", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            alertController.dismiss(animated: true, completion: nil)
        })
        let retryAction = UIAlertAction(title: "Try again", style: .default, handler: {
            action in
            self.calculateLocationDistances()
        })
        alertController.addAction(dismissAction)
        alertController.addAction(retryAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
