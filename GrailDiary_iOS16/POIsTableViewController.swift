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
        cell.poi = poi
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController else { return }
            addPOIVC.delegate = self
        }
        else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController {
                poiDetailVC.poi = pOIs[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pOIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
