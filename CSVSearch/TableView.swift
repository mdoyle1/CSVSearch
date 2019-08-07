//
//  TableView.swift
//  TableView
//
//  Created by administrator on 6/30/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import Foundation
import Cocoa



class TableView: NSTableView, NSTableViewDataSource, NSTableViewDelegate {
    
    var tableContainer = NSScrollView.init(frame: NSRect(x:0, y: 0, width: 800, height: 200))
    var tableView:NSTableView = NSTableView(frame: NSRect(x:0, y: 0, width: 800, height: 200))
    
    func populateHeaders(){
        for x in 0..<headers.count {
            let column = NSTableColumn.init(identifier:NSUserInterfaceItemIdentifier(rawValue: headers[x]))
            tableView.addTableColumn(column)
            column.headerCell = NSTableHeaderCell(textCell: headers[x])
        }
    }
    
    func setup (){
        tableView.usesAlternatingRowBackgroundColors = true
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        tableContainer.documentView = tableView
        tableContainer.hasVerticalScroller = true
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return csvArray.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let dict = csvArray[row]
        for x in 0..<headers.count {
            if ((tableColumn?.identifier)!.rawValue == headers[x]) {
                return dict[headers[x]]
            }
        }
        return "nil"
        
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true
    }

   
}


