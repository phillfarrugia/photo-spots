//
//  ViewController.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import UIKit
import PhotoSpotsCore

class LocationsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    internal var viewModels: [LocationsListCellViewModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Locations"
    }
    
    private func configureTableView() {
        tableView.registerReusableCell(LocationsListTableViewCell.self)
        tableView.rowHeight = LocationsListTableViewCell.cellHeight
        tableView.dataSource = self
        tableView.delegate = self
    }


}

