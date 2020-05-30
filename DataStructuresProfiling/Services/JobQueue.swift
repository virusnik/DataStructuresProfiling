//
//  JobQueue.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 5/24/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

struct JobQueue<Value> {
    let queue: DispatchQueue = .main
    let closure: () -> Value

    func perform(then handler: @escaping (Value) -> Void) {
        queue.async {
            let value = self.closure()
            handler(value)
        }
    }
}
