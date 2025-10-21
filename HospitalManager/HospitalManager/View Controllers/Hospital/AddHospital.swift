//
//  AddHospital.swift
//  HospitalManager
//
//  Created by Mumthasir VP on 20/10/25.
//

import UIKit

class AddHospital: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emergencySwitch: UISwitch!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        emergencySwitch.isOn = false
    }

    @IBAction func addHospital(_ sender: Any) {
        guard
            let idText = idTextField.text, let id = Int(idText),
            let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty
        else {
            showAlert("Error", "Please fill all fields correctly.")
            return
        }
        
        let hospital = Hospital(id: id, name: name, address: address, hasEmergency: emergencySwitch.isOn)
        let result = dataManager.addHospital(hospital)
        showAlert(result.0 ? "Success" : "Error", result.1)
        clearAll()
    }
    
    private func clearAll() {
        idTextField.text = ""
        nameTextField.text = ""
        addressTextField.text = ""
        emergencySwitch.isOn = false
    }
}
