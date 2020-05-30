//
//  Matches.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 5/30/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation
class Matches {
    
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch {
            return []
        }
    }
}
