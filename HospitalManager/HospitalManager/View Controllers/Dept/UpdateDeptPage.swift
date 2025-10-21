//
//  UpdateDeptPage.swift
//  HospitalManager
//
//  Created by Mumthasir VP on 21/10/25.
//

import UIKit

class UpdateDeptPage: UIViewController {

    @IBOutlet weak var totalBedsTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func updateDeptAction(_ sender: Any) {
        guard let idText = idTextField.text, let id = Int(idText) else {
            showAlert("Error", "Please enter a valid Department ID.")
            return
        }
        
        let newName = nameTextField.text?.isEmpty == false ? nameTextField.text : nil
        let newBeds: Int? = {
            if let bedsText = totalBedsTextField.text, let beds = Int(bedsText) {
                return beds
            }
            return nil
        }()
        
        if newName == nil && newBeds == nil {
            showAlert("Error", "Please enter at least one field to update.")
            return
        }
        
        let result = dataManager.updateDepartment(id: id, newName: newName, newBeds: newBeds)
        showAlert(result.0 ? "Success" : "Error", result.1)
    }
    
}
