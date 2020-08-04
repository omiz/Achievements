//
//  DataManager.swift
//  AchievementsCoreData
//
//  Created by Omar Allaham on 8/4/20.
//  Copyright © 2020 Martian Bears. All rights reserved.
//

import Foundation
import CoreData

public class DataManager: NSObject {

    public static var shared: DataManager = .init()
    
    lazy var persistentContainerQueue: OperationQueue = {
        
        let queue = OperationQueue()
        
        queue.name = "DataManagerPersistentContainerQueue"
        
        queue.qualityOfService = .userInitiated
        
        queue.maxConcurrentOperationCount = 1
        
        return queue
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = MBPersistentCloudKitContainer()
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error), userInfo: \(String(describing: error._userInfo))")
            }
        })
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        container.viewContext.shouldDeleteInaccessibleFaults = true
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    }()
}
