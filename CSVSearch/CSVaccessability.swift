//
//  csv_parser.swift
//  phone_inventory
//
//  Created by Doyle, Mark(Information Technology Services) on 6/28/19.
//  Copyright © 2019 Doyle, Mark(Information Technology Services). All rights reserved.
//
import Foundation

var csvData:[[String]]!


class CSVaccessability {
    
    var numberOfColumns:Int!
    var dictionaryItems = [String:String]()
    var masterList = [[String:Any]]()
    
    func makeCSVaccessable() {
        headers = csvData[0]
    for r in 1..<csvData.count-1{
        for h in 0..<headers.count{
            dictionaryItems[headers[h]]=csvData[r][h]}
    csvArray.append(dictionaryItems)}
    }

    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\"", with:"")
        return cleanFile}
    
    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }
        return result
    }
    
    func csvToList(){
        if let url = globalPathToCsv {
            do {
                var data = try String(contentsOf: url as URL)
                data = cleanRows(file: data)
                csvData = csv(data: data)
                makeCSVaccessable()
            } catch {print("contents could not be loaded")}}
        else {print("the URL was bad!")}
    }

}
    


