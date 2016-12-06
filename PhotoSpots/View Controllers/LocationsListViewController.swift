//
//  ViewController.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import UIKit
import PhotoSpotsCore

class LocationsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UserLocationHandlerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    internal let locationHandler = UserLocationHandler()
    
    internal var viewModels: [LocationsListCellViewModel]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Locations"
        
        configureTableView()
        configureRefreshControl()
        configureNavigation()
        viewModels = reloadViewModels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        calculateLocationDistances()
    }
    
    private func configureTableView() {
        tableView.registerReusableCell(LocationsListTableViewCell.self)
        tableView.rowHeight = LocationsListTableViewCell.cellHeight
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(LocationsListViewController.addBarButtonItemDidPress))
    }
    
    private func reloadViewModels() -> [LocationsListCellViewModel] {
        return LocationsController.sharedInstance.locations.map {
            return LocationsListCellViewModel(location: $0)
        }
    }
    
    internal func calculateLocationDistances() {
        locationHandler.delegate = self
        locationHandler.requestPermissions()
        locationHandler.requestOneTimeLocationUpdate()
    }
    
    // MARK: UIBarButtonItems
    
    internal func addBarButtonItemDidPress() {
        // TODO: Show Add View Controller
    }
    
    // MARK: Pull to Refresh
    
    private func configureRefreshControl() {
        let tableViewRefreshControl = UIRefreshControl()
        tableViewRefreshControl.addTarget(self, action: #selector(LocationsListViewController.didPullToRefresh), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = tableViewRefreshControl
        }
    }
    
    internal func didPullToRefresh() {
        viewModels = reloadViewModels()
        calculateLocationDistances()
        tableView.refreshControl?.endRefreshing()
    }


}

