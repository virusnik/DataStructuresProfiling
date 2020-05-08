//
//  SuffixSequenceViewController.swift
//  DataStructuresProfiling
//
//  Created by Sergio Veliz on 5/7/20.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation
import UIKit

private enum SuffixArrayVCRow: Int {
    case creation = 0,
    sortArray,
    searchRandomThreeLetters,
    searchQuantitySubstrings
}

class SuffixSequenceViewController: DataStructuresViewController {
    //MARK: - Variables

    let suffixArrayManipulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()

    var creationTime: TimeInterval = 0
    var sortArrayTime: TimeInterval = 0
    var searchRandomThreeLettersTime: TimeInterval = 0
    var searchQuantitySubstringsTime: TimeInterval = 0

    //MARK: - Methods
    //MARK: View lifecycle
    override func viewDidLoad() {
      super.viewDidLoad()
      createAndTestButton.setTitle("Create SuffixIterator and Test", for: UIControl.State())
    }

    //MARK: Superclass creation/testing overrides

    override func create(_ size: Int) {
        creationTime = suffixArrayManipulator.setupWithItemsCount(size)
    }
    
    override func test() {
        if suffixArrayManipulator.suffixArrayHasObject() {
            sortArrayTime = suffixArrayManipulator.sortItemsSuffixArray()
            searchRandomThreeLettersTime = suffixArrayManipulator.searchRandomThreeLetters()
            searchQuantitySubstringsTime = suffixArrayManipulator.searchQuantitySubstrings()
        } else {
            print("Suffix Array not yet set up!")
        }
    }

    //MARK: Table View Override

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //There are always 4 items
      return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        switch (indexPath as NSIndexPath).row {
        case SuffixArrayVCRow.creation.rawValue:
            cell.textLabel!.text = "Creation:"
            cell.detailTextLabel!.text = formattedTime(creationTime)
        case SuffixArrayVCRow.sortArray.rawValue:
            cell.textLabel!.text = "Sorting:"
            cell.detailTextLabel!.text = formattedTime(sortArrayTime)
        case SuffixArrayVCRow.searchRandomThreeLetters.rawValue:
            cell.textLabel!.text = "Search for random three letters:"
            cell.detailTextLabel!.text = formattedTime(searchRandomThreeLettersTime)
        case SuffixArrayVCRow.searchQuantitySubstrings.rawValue:
            cell.textLabel!.text = "Search quantity substring:"
            cell.detailTextLabel!.text = formattedTime(searchQuantitySubstringsTime)
        default:
            print("Unhandled row! \((indexPath as NSIndexPath).row)")
        }

        return cell
    }
}
