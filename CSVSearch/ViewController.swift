//
//  ViewController.swift
//  CSVSearch
//
//  Created by administrator on 7/28/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import Cocoa

var csvArray = [[String:String]]()
var headers = [String]()
var globalPathToCsv:NSURL!
var csv = CSVaccessability()

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        tableContainer.documentView = tableView
        tableContainer.hasVerticalScroller = true
    }
    

    @IBOutlet weak var submitBtnObj: NSButton!
    @IBOutlet weak var importBtnObj: NSButton!
    @IBAction func submitBtn(_ sender: NSButton) {
        importBtnObj.isHidden = false
        csv.csvToList()
        self.view.addSubview(tableContainer)
        submitBtnObj.isHidden = true
        setup()
        populateHeaders()
     
    }
    
    @IBAction func importBtn(_ sender: Any) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = ["csv"]
        openPanel.begin { (result) in
            if result == NSApplication.ModalResponse.OK {
                globalPathToCsv = openPanel.url! as NSURL
            }}
submitBtnObj.isHidden = false
importBtnObj.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtnObj.isHidden = true
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
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

