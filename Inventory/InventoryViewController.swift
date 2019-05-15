//
//  InventoryViewController.swift
//  Inventory
//
//  Created by Melissa Hollingshed on 5/2/19.
//  Copyright © 2019 Melissa Hollingshed. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // The following calls the static "load" function on the Inventory struct
    // giving it the name of the json file to load from (without the filename extension)
    var inventory = Inventory.load(from: "inventory")
    
    // The above reads rather nicely...
    
    // Hey Inventory, load from "inventory"...
    // Assign what was loaded to inventory
    
    // Load data from inventory.json and create an Inventory instance that is assigned
    // to the variable "inventory"
    
    // Inventory is the type ...on the type we ask it to load data to create an instance of that type
    // and specify the data is from  a json file called "inventory".
    
    // Note: Inventory is defined in Inventory.swift in the Model group

    @IBOutlet weak var inventoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
        if let product = inventory?.products[indexPath.row] {
            cell.textLabel?.text = product.title
            cell.detailTextLabel?.text = "In stock: \(product.stockedQuantity), Price: $\(String(format: "%.2f", product.price)), Category: \(product.category)"
            
            // String(format: "%.2f", product.price) is used because prices need to have two digits to right of decimal point
            // $399.00 not $399.0
        }
        
        return cell
    }
}

