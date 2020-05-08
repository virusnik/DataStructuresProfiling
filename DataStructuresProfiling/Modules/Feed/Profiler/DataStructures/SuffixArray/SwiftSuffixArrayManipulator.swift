//
//  SwiftSuffixArrayManipulator.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 5/7/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

open class SwiftSuffixArrayManipulator: SuffixArrayManipulator {
    var suffixArray = [String]()
    var numberOfThreeLettesToFind: Int = 0
    
    func suffixArrayHasObject() -> Bool {
        if suffixArray.count == 0 {
          return false
        } else {
          return true
        }
    }
    
    func setupWithItemsCount(_ count: Int) -> TimeInterval {
        numberOfThreeLettesToFind = count
        
        return Profiler.runClosureForTime(){
            for word in AlgoProvider().all {
                for suffix in SuffixSequence(stringValue: word){
                    self.suffixArray.append(String(suffix))
                }
            }
        }
    }
    
    func sortItemsSuffixArray() -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.suffixArray.sort { $0 < $1 }
        }
    }
    
    func searchRandomThreeLetters() -> TimeInterval {
        var threeLettersArray = [String]()
        
        for _ in 0...9 {
            threeLettersArray.append(StringGenerator().generateRandomString(3))
        }
        
        return Profiler.runClosureForTime() {
            for threeLettersSeq in threeLettersArray {
                self.suffixArray.contains(threeLettersSeq)
            }
        }
    }
    
    func searchQuantitySubstrings() -> TimeInterval {
        var threeLettersArray = [String]()
        
        for _ in 0...numberOfThreeLettesToFind {
            threeLettersArray.append(StringGenerator().generateRandomString(3))
        }
        
        return Profiler.runClosureForTime() {
            for threeLettersSeq in threeLettersArray {
                self.suffixArray.contains(threeLettersSeq)
            }
        }
    }
    
    
    
}
