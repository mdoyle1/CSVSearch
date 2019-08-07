//
//  AdapterTableView.swift
//  CSVSearch
//
//  Created by administrator on 8/6/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import Foundation
import Cocoa

class AdapterTableView: NSObject {
    fileprivate static let column = "column"
    fileprivate static let heightOfRow: CGFloat = 26
    
//    fileprivate var items: [User] = [User]() {
//        didSet {
//            tableView.reloadData()
//        }
    }
    
    private var tableView: NSTableView
    
    init(tableView: NSTableView) {
        self.tableView = tableView
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
//    func add(items: [User]) {
//        self.items += items
//    }
}

extension AdapterTableView: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return csvArray.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard (tableColumn?.identifier)!.rawValue == AdapterTableView.column else { fatalError("AdapterTableView identifier not found") }
        
        let name = csvArray[row]["Description"]
        let view = NSTextField(string: name)
        view.isEditable = false
        view.isBordered = false
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return AdapterTableView.heightOfRow
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true
    }
}
