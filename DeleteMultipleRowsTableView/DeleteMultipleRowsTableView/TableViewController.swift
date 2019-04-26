//
//  TableViewController.swift
//  DeleteMultipleRowsTableView
//
//  Created by duycuong on 4/26/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var numbers = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelectionDuringEditing = true
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = numbers[indexPath.row]

        return cell
    }
    
    
    // MARK: - Actions
    
    @IBAction func startEditing(_ sender: UIBarButtonItem) {
        
        isEditing = !isEditing
        
    }
    
    
    @IBAction func deleteRows(_ sender: UIBarButtonItem) {
        // delete all
//        if let selectedRows = tableView.indexPathsForVisibleRows {
        // delete when choose
        if let selectedRows = tableView.indexPathsForSelectedRows {
            // 1
            var items = [String]()
            
            for indexPath in selectedRows {
                items.append(numbers[indexPath.row])
            }
            
            // 2
            for item in items {
                if let index = numbers.index(of: item) {
                    numbers.remove(at: index)
                }
            }
            
            // 3
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
        }
    }
    

}
