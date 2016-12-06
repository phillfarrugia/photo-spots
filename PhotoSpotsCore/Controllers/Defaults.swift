//
//  Defaults.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation

public class Defaults {
    
    // MARK: Has Run App
    
    private static let khasRunAppKey = "com.photospots.hasRunApp"
    
    public static var hasRunApp: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Defaults.khasRunAppKey)
        }
        set {
            UserDefaults.standard.set(hasRunApp, forKey: Defaults.khasRunAppKey)
        }
    }
    
}
