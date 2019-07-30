//
//  TableView.swift
//  TableView
//
//  Created by administrator on 6/30/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import Foundation
import Cocoa

class TableView{

    var tableContainer = NSScrollView.init(frame: NSRect(x:0, y: 0, width: 800, height: 200))
    var tableView = NSTableView(frame: NSRect(x:0, y: 0, width: 800, height: 200))
    func populateHeaders(){
        for x in 0..<headers.count {
            let column = NSTableColumn.init(identifier:NSUserInterfaceItemIdentifier(rawValue: headers[x]))
            tableView.addTableColumn(column)
            column.headerCell = NSTableHeaderCell(textCell: headers[x])
            }
        }
    
    func createColumns(header: [String]){
        for x in 0..<header.count{
    let column = NSTableColumn.init(identifier:NSUserInterfaceItemIdentifier(rawValue: header[x]))
            tableView.addTableColumn(column)
            column.headerCell = NSTableHeaderCell(textCell: header[x])
        }
    }
  
    init (){
        populateHeaders()
        //Adds columns and names from headers array
        tableView.delegate = self as? NSTableViewDelegate
        tableView.dataSource = self as? NSTableViewDataSource
        tableView.reloadData()
        tableContainer.documentView = tableView
        tableContainer.hasVerticalScroller = true
        
    }

    
}

