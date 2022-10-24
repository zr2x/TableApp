//
//  MainVC.swift
//  TableApp
//
//  Created by Искандер Ситдиков on 11.10.2022.
//

import UIKit
import RealmSwift

class MainVC: UITableViewController {
    
    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = realm.objects(Place.self) 
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
        cell.typeLabel.text =  place.type
        cell.locationLabel.text = place.location
        // FIXME: unwrap error
       // guard place.imageData != nil else { return cell}
        cell.imageOfRestaurant.image = UIImage(data: place.imageData?)
        cell.imageOfRestaurant.layer.cornerRadius = cell.imageOfRestaurant.frame.height / 2
        cell.imageOfRestaurant.clipsToBounds = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let place = places[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete?") { _, _ in
            
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let place = places[indexPath.row]
//        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { _, _ in
//
//            StorageManager.deleteObject(place)
//            tableView.delete(place)
//        }
//        return [deleteAction]
//    }
//
    @IBAction func unwindSegue (_ seague: UIStoryboardSegue) {
        guard let newPlaceVC = seague.source as? NewPlaceVC else { return }
        newPlaceVC.saveNewPlace() 
         tableView.reloadData()
    }
    
    
}
