//
//  MockData.swift
//  OTUS
//
//  Created by Дмитрий Матвеенко on 16/06/2019.
//  Copyright © 2019 GkFoxes. All rights reserved.
//

import Foundation
import UIKit

struct FeedData {
    let name: CollectionType
    var time: TimeInterval
    var color: UIColor
}

enum CollectionType: String {
    case array = "Array"
    case dictionary = "Dictionary"
    case set = "Set"
}

