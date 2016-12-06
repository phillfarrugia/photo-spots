//
//  LocationsListTableViewCell.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import UIKit
import PhotoSpotsCore

class LocationsListTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet private var coverImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var distanceLabel: UILabel!
    
    
    private var viewModel: LocationsListCellViewModel? {
        didSet {
            configure(forViewModel: viewModel)
        }
    }
    
    static let cellHeight: CGFloat = 110.0
    
    // MARK: Factory Method
    
    class func tableView(tableView: UITableView, dequeueReusableCellForViewModel viewModel: LocationsListCellViewModel? = nil, atIndexPath indexPath: IndexPath) -> LocationsListTableViewCell? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? LocationsListTableViewCell {
            cell.viewModel = viewModel
            return cell
        }
        return nil
    }
    
    private func configure(forViewModel viewModel: LocationsListCellViewModel?) {
        if let viewModel = viewModel {
            titleLabel.text = viewModel.title
            distanceLabel.text = viewModel.distance
        }
    }
    
}
