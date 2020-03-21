//
//  AddPOIViewController.swift
//  GrailDiary_iOS16
//
//  Created by Stephanie Ballard on 3/19/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let newLocation = locationTextField.text,
            let newCountry = countryTextField.text else { return }
        
        var newClues: [String] = []
        
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            newClues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            newClues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            newClues.append(clue3)
        }
        
        let poi = POI(location: newLocation, country: newCountry, clues: newClues)
        delegate?.poiWasAdded(poi)
        dismiss(animated: true, completion: nil)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case locationTextField:
                return countryTextField.becomeFirstResponder()
            case countryTextField:
                return clue1TextField.becomeFirstResponder()
            case clue1TextField:
                return clue2TextField.becomeFirstResponder()
            case clue2TextField:
                return clue3TextField.becomeFirstResponder()
            case clue3TextField:
                return clue3TextField.resignFirstResponder()
            default:
                return false
            }
        }
        return false
    }
}
