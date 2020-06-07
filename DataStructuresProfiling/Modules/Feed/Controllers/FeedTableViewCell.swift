//
//  FeedTableViewCell.swift
//  OTUS
//
//  Created by Дмитрий Матвеенко on 16/06/2019.
//  Copyright © 2019 GkFoxes. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    static let reuseID = String(describing: FeedTableViewCell.self)
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func updateCell(feedData: FeedData) {
        nameLabel.text = feedData.name.rawValue
        valueLabel.text = (feedData.time < 0) ? "" : Services.timeNumberFormatter.string(from: feedData.time as NSNumber)
        valueLabel.textColor = feedData.color
    }
}
