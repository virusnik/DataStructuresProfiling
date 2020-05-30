//
//  SessionSummaryViewController.swift
//  OTUS
//
//  Created by Дмитрий Матвеенко on 16/06/2019.
//  Copyright © 2019 GkFoxes. All rights reserved.
//

import UIKit

class SessionSummaryViewController: UIViewController {
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var textLabel: UILabel!
    
    var sharedText = ""
    var locale = "en_US"
    private let matches = Matches()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NotificationCenter.default
        if #available(iOS 13.0, *) {
            notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIScene.willEnterForegroundNotification, object: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textLabel.text = updateFormatText(value: sharedText, locale: locale)
    }
    
    @objc func appMovedToForeground(){
        if let ud = UserDefaults(suiteName: "DataStructuresProfiling") {
            if let textFromUD = ud.object(forKey: "text") as? String {
                sharedText = textFromUD
                textLabel.text = sharedText
            }
        }
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        switch segmentController.selectedSegmentIndex {
        case 0:  locale = "en_US"
        case 1:  locale = "fr"
        default: locale = Locale.current.languageCode ?? "en_US"
        }
        textLabel.text = updateFormatText(value: sharedText, locale: locale)
    }
    
    private func updateFormatText(value: String?, locale: String) -> String {
        guard let tx = value else { return "" }
        var str = tx
        let locale = Locale(identifier: locale)
        
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.locale = locale
        let replace = tx.replacingOccurrences(of: ",", with: ".")
        let matched = matches.matches(for: "[+-]?([0-9]*[.])?[0-9]+", in: replace)
        let measurment = matched.map{ Measurement(value: Double($0)!, unit: UnitLength.kilometers) }
        str = measurment.compactMap{ measurementFormatter.string(for: $0) }.joined(separator:", ")
        
        return str
    }
    
}
