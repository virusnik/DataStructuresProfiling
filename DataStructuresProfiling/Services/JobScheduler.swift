//
//  JobScheduler.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 5/24/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

class JobScheduler {
    
    var jobs: [JobQueue] = []
    var completion: (([JobQueue]) -> Void)?
    
    func runJobs() {
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "test.scheduler", qos: .userInitiated)
        
        for job in jobs {
            group.enter()
            queue.async {
                job.execute()
                group.leave()
            }
            group.wait()
        }
        completion?(jobs)
    }
    
}
