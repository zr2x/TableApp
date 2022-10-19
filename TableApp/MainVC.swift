//
//  MainVC.swift
//  TableApp
//
//  Created by Искандер Ситдиков on 11.10.2022.
//

import UIKit

class MainVC: UITableViewController {
    
    
    
    var place = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return place.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        let placeIndex = place[indexPath.row
        ]
        cell.nameLabel.text = placeIndex.name
        cell.typeLabel.text =  placeIndex.type
        cell.locationLabel.text = placeIndex.location
        
        if placeIndex.image == nil {
            cell.imageOfRestaurant.image = UIImage(named: placeIndex.restaurantImage!)
        } else {
            cell.imageOfRestaurant.image = placeIndex.image
        }
        cell.imageOfRestaurant.layer.cornerRadius = cell.imageOfRestaurant.frame.height / 2
        cell.imageOfRestaurant.clipsToBounds = true
        return cell
    }

    
    @IBAction func unwindSegue (_ seague: UIStoryboardSegue) {
        guard let newPlaceVC = seague.source as? NewPlaceVC else { return }
        newPlaceVC.saveNewPlace() 
        place.append(newPlaceVC.newPlace! )
        tableView.reloadData()
    }
}
