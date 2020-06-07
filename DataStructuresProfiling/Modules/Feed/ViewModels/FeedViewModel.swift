//
//  FeedViewModel.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 6/7/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

class FeedViewModel {
    
    public var feedData = Services.feedProvider.feedMockData()
    var testsCompletion: (() -> Void)?
    
    let arrayManipulator: ArrayManipulator = SwiftArrayManipulator()
    let dictionaryManipulator: DictionaryManipulator = SwiftDictionaryManipulator()
    let setManipulator: SetManipulator = SwiftSetManipulator()
    
    func runTests(_ numberOfTests: Int) {
        print("run test \(numberOfTests) items")
        
        let arrayJob = JobQueue()
        arrayJob.task = {
            return self.arrayManipulator.setupWithObjectCount(numberOfTests)
        }
        
        let dictJob = JobQueue()
        dictJob.task = {
            return self.dictionaryManipulator.setupWithEntryCount(numberOfTests)
        }
        
        let setJob = JobQueue()
        setJob.task = {
            return self.setManipulator.setupWithObjectCount(numberOfTests)
        }
        
        let scheduler = JobScheduler()
        scheduler.jobs = [arrayJob, dictJob, setJob]
        scheduler.completion = { [weak self] jobs in
            guard let strongSelf = self else { return }
            guard strongSelf.feedData.count >= 3 && jobs.count >= 3 else { return }
            for index in 0..<3 {
                strongSelf.feedData[index].time = jobs[index].executionTime
            }
            strongSelf.testsCompletion?()
        }

        scheduler.runJobs()
    }
    
    public func numberOfRowsInSection() -> Int {
        return feedData.count
    }
    
    public func getItemFromIndex(_ indexPath: IndexPath) -> FeedData? {
        feedData.indices.forEach{ feedData[$0].color = .black}
        if let index = feedData.firstIndex(where: { $0.name == feedData[indexPath.row].name}) {
            feedData[index].time = feedData[indexPath.row].time
        }
        let sortedFeed = feedData.filter({ $0.time > 0}).sorted{ $0.time < $1.time}
        if let maxIndex = feedData.firstIndex(where: { $0.name == sortedFeed.last?.name}), let minIndex = feedData.firstIndex(where: { $0.name == sortedFeed.first?.name}) {
            feedData[maxIndex].color = .red
            feedData[minIndex].color = .green
        }

        return feedData[indexPath.row]
    }
}
