//
//  LocalStorage.swift
//  PhotoSpots
//
//  Created by Phill Farrugia on 6/12/16.
//  Copyright © 2016 Phill Farrugia. All rights reserved.
//

import Foundation

class LocalStorage {
    
    static let kDocumentsFilePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    
    static func save(objects: [Any], forKey key: String) {
        let filePath = LocalStorage.kDocumentsFilePath.appending("/\(key).data")
        NSKeyedArchiver.archiveRootObject(objects, toFile: filePath)
    }
    
    static func read(objectsForKey key: String) -> [Any]? {
        let filePath = LocalStorage.kDocumentsFilePath.appending("/\(key).data")
        return NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Any]
    }
    
}
