//
//  SuffixSequence.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 5/7/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

struct SuffixIterator: IteratorProtocol {
    let value: String
    var last: String.Index
    var offset: String.Index
    
    init(value: String) {
        self.value = value
        self.last = value.endIndex
        self.offset = value.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offset < last else { return nil }
        
        let sub: Substring = value[offset..<last]
        value.formIndex(after: &offset)
        return sub
    }
}

struct SuffixSequence: Sequence {
    let stringValue: String
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(value: stringValue)
    }
}

//struct SuffixArray {
//    let data = AlgoProvider()
//    var suffixes: [(String, String)] = []
//
//    mutating func getSuffixes() {
//        for value in data.all {
//            let sequence = SuffixSequence(stringValue: value)
//            for suffix in sequence {
//                suffixes.append((String(suffix), value))
//            }
//        }
//    }
//
//    mutating func sortSuffixes() {
//        suffixes.sort { $0.0 < $1.0 }
//    }
//}
