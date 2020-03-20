//
//  POIsTableViewController.swift
//  GrailDiary_iOS16
//
//  Created by Stephanie Ballard on 3/17/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pOIs = [POI]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pOIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell
            else {
                return UITableViewCell()
                
        }
        let poi = pOIs[indexPath.row]
            cell.locationTextField.text = poi.location
            cell.countryLabel.text = poi.country
        //TODO: finish set outlets for labels in cellcontroller, finish setting up the cell, create an array for clues?
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pOIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
