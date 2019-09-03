//
//  PlacesViewController.swift
//  MemorablePlace
//
//  Created by The book Air on 02/09/2019.
//  Copyright © 2019 jisung. All rights reserved.
//

import Foundation
import UIKit

var places = [Dictionary<String, String>()]
var activePlace = -1

class PlacesViewController : UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let tempPlaces = UserDefaults.standard.object(forKey: "places") as? [Dictionary<String, String>]{
            
            places = tempPlaces
        }
       
        if places.count == 1 && places[0].count == 0 {
            places.remove(at: 0)
            
            places.append(["name":"Kyoung Bok Palace","lat":"37.579617", "lon":"126.977041"])
            
            UserDefaults.standard.set(places, forKey: "places")
        }
        
        activePlace = -1
        
        table.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
        if editingStyle == UITableViewCell.EditingStyle.delete {
            places.remove(at: indexPath.row)
            
            UserDefaults.standard.set(places, forKey: "places")
            
            tableView.reloadData()
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        if places[indexPath.row]["name"] != nil {
            cell.textLabel?.text = places[indexPath.row]["name"]
        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        activePlace = indexPath.row
        
        performSegue(withIdentifier: "toMap", sender: nil)
    }
}
