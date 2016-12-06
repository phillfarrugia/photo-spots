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
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    
    
    private var viewModel: LocationsListCellViewModel?
    
    static let cellHeight: CGFloat = 110.0
    
    // MARK: Factory Method
    
    class func tableView(tableView: UITableView, dequeueReusableCellForViewModel viewModel: LocationsListCellViewModel? = nil, atIndexPath indexPath: IndexPath) -> LocationsListTableViewCell? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? LocationsListTableViewCell {
            cell.viewModel = viewModel
            return cell
        }
        return nil
    }
    
}
