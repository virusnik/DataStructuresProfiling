//
//  SuffixArrayManipulator.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 5/7/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

protocol SuffixArrayManipulator {
    func suffixArrayHasObject() -> Bool
    func setupWithItemsCount(_ count: Int) -> TimeInterval
    func sortItemsSuffixArray() -> TimeInterval
    func searchRandomThreeLetters() -> TimeInterval
    func searchQuantitySubstrings() -> TimeInterval
}
