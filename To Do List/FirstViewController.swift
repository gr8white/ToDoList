//
//  FirstViewController.swift
//  To Do List
//
//  Created by Derrick White on 12/30/18.
//  Copyright © 2018 Derrick White. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var items: [String] = [] //Creates the string that holds all of the to do list items
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count // creates a row for each object in the "items" array
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell // Populates the cell text with the information from the "items" array
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject  = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
        }
        
        table.reloadData() // Refreshes the screen whenever user clicks over; reloads the data automatically
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
            
             // allows user the option to delete items from the list; "UserDefaults..." line permanently deletes the data
            
        }
        
    }
    
    
}

