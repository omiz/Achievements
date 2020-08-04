//
//  MBPersistentCloudKitContainer.swift
//  AchievementsCoreData
//
//  Created by Omar Allaham on 8/4/20.
//  Copyright © 2020 Martian Bears. All rights reserved.
//

import CoreData

class MBPersistentCloudKitContainer: NSPersistentCloudKitContainer {

    override class func defaultDirectoryURL() -> URL {
        
        let defaultURL = super.defaultDirectoryURL()
        
        let url = defaultURL.appendingPathComponent("CoreData")
        
        try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        
        return url
    }
    
    convenience init() {
        self.init(name: "DataModel")
    }
}
