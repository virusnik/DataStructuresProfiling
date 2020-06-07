//
//  BaseView.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 6/3/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame:frame)
        initialize()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initialize() {

    }
}
