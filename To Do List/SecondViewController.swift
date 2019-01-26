//
//  SecondViewController.swift
//  To Do List
//
//  Created by Derrick White on 12/30/18.
//  Copyright © 2018 Derrick White. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func add(_ sender: Any) {
        
        let itemsObject  = UserDefaults.standard.object(forKey: "items")
        
        var items:[String] // Creates the new string "items"
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
            items.append(itemTextField.text!) // Text from the text field is added the "items" array
            
            print(items)
            
        } else {
            
            items = [itemTextField.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items") // The new array dtat is permanently saved
        
        itemTextField.text = "" // Textfield is reset and ready for the next entry
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true) // Makes the keyboard disappear when "view" screen is clicked
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder() // Makes the keyboard disappear when "return" key is clicked
        
        return true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

