//
//  LocationsListViewController+TableView.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import UIKit
import PhotoSpotsCore

extension LocationsListViewController {
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModels = self.viewModels else {
            return 0
        }
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModels = self.viewModels, viewModels.count > indexPath.row,
        let locationCell = LocationsListTableViewCell.tableView(tableView: tableView, dequeueReusableCellForViewModel: viewModels[indexPath.row], atIndexPath: indexPath)
            else { return UITableViewCell() }
        return locationCell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Present Detail
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // TODO: Delete location model
        }
    }
    
}
