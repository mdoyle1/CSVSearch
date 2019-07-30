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

class ViewController: NSViewController {

    @IBOutlet weak var submitBtnObj: NSButton!
    @IBOutlet weak var importBtnObj: NSButton!
    @IBAction func submitBtn(_ sender: NSButton) {
        importBtnObj.isHidden = false
        csv.csvToList()
self.view.addSubview(TableView().tableContainer)
        submitBtnObj.isHidden = true
        
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


}


