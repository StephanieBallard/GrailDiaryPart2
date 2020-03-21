//
//  POITableViewCell.swift
//  GrailDiary_iOS16
//
//  Created by Stephanie Ballard on 3/19/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var numberOfClues: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        numberOfClues.text = "\(poi.clues.count) clues"
    }
}
