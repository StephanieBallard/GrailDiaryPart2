//
//  POIDetailViewController.swift
//  GrailDiary_iOS16
//
//  Created by Stephanie Ballard on 3/19/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationNameLabel.text = poi.location
        countryLabel.text = poi.country
        
        var cluesText = ""
        for clue in poi.clues {
            cluesText += "\(clue)\n"
        }
        cluesTextView.text = cluesText
    }
}
