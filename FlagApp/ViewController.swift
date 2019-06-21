//
//  ViewController.swift
//  FlagApp
//
//  Created by Emanuel Schmoczer on 21.06.19.
//  Copyright © 2019 Emanuel Schmoczer. All rights reserved.
//

import Atlas
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flagLabel: UILabel!

    @IBOutlet weak var countryPicker: UIPickerView!

    let countryCodes = NSLocale.isoCountryCodes

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        countryPicker.delegate = self
        countryPicker.dataSource = self
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        flagLabel.text = Country(code: countryCodes[row]).emojiFlag
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCodes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryCodes[row]
    }
}
