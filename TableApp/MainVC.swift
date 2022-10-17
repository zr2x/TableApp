//
//  MainVC.swift
//  TableApp
//
//  Created by Искандер Ситдиков on 11.10.2022.
//

import UIKit

class MainVC: UITableViewController {
    
    
    
    let place = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return place.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.nameLabel.text = place[indexPath.row].name
        cell.typeLabel.text = place[indexPath.row].type
        cell.locationLabel.text = place[indexPath.row].location
        cell.imageOfRestaurant.image = UIImage(named: place[indexPath.row].image)
        cell.imageOfRestaurant.layer.cornerRadius = cell.imageOfRestaurant.frame.height / 2
        cell.imageOfRestaurant.clipsToBounds = true
        return cell
    }


@IBAction func cancelAction(_ seague: UIStoryboardSegue) {}
}
