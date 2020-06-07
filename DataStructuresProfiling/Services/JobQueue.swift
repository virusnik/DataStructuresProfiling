//
//  JobQueue.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 5/24/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

class JobQueue {
    
    var task: (() -> TimeInterval)?
    
    var executionTime: TimeInterval = 0
    
    func execute() {
        guard let task = task else { return }
        let time = task()
        executionTime = time
    }
}
