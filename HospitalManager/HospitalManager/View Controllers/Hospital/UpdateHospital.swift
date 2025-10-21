//
//  UpdateHospital.swift
//  HospitalManager
//
//  Created by Mumthasir VP on 20/10/25.
//

import UIKit

class UpdateHospital: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func updateAction(_ sender: Any) {
        guard let idText = idTextField.text, let id = Int(idText),
              let newName = nameTextField.text, !newName.isEmpty else {
            showAlert("Error", "Please enter valid ID and new name.")
            return
        }
        
        let result = dataManager.updateHospital(id: id, newName: newName)
        showAlert(result.0 ? "Success" : "Error", result.1)
        
        clearAll()
    }
    
    private func clearAll() {
        nameTextField.text = ""
        idTextField.text = ""
    }

}
