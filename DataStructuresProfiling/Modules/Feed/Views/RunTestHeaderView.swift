//
//  RunTestHeaderView.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 6/3/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import UIKit

protocol RunTestHeaderDelegate: class {
    func runTests(numberOfTests: Int, completion: @escaping () -> Void)
}

class RunTestHeaderView: BaseView {
    
    weak var delegate: RunTestHeaderDelegate?
    
    private lazy var runButton : UIButton = {
        let button = UIButton.init(type: .system)
        button.setTitle("Run", for: .normal)
        button.addTarget(self, action: #selector(runTapped), for: .touchUpInside)
        return button
    }()
    
    private var numberOfTests: Int = 10000
    
    deinit {}
    
    override func initialize() {
        
        addSubview(runButton)
        
        runButton.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = runButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let verticalConstraint = runButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
    
    @objc func runTapped() {
        runButton.isEnabled = false
        DispatchQueue.global(qos: .userInitiated).async {
            self.delegate?.runTests(numberOfTests: self.numberOfTests) {
                self.runButton.isEnabled = true
            }
        }
    }
}
