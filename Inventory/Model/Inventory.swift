//
//  Inventory.swift
//  Inventory
//
//  Created by Melissa Hollingshed on 5/2/19.
//  Copyright © 2019 Melissa Hollingshed. All rights reserved.
//

// The static "load" function on the Inventory struct is used to
// load the json file from the app bundle and decode the JSON to
// an Inventory instance.

import Foundation

struct Inventory: Decodable {
    var status : String
    var products : [Product]
    
    static func load(from filename: String) -> Inventory? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return nil
        }
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode(Inventory.self, from: data)
    }
}

struct Product: Decodable {
    var id : Int
    var category : String
    var title : String
    var price : Double
    var stockedQuantity: Int
}

/*
"id": 1343,
"category": "Computers",
"title": "Redragon K552 KUMARA LED Backlit Mechanical Gaming Keyboard",
"price": 29.99,
"stockedQuantity": 9
*/
