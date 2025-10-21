//
//  AddDeptPage.swift
//  HospitalManager
//
//  Created by Mumthasir VP on 21/10/25.
//

import UIKit

class AddDeptPage: UIViewController {

    @IBOutlet weak var totalBedsTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hospitalIDTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addDepartmentAction(_ sender: Any) {
        guard
            let idText = idTextField.text, let id = Int(idText),
            let hospitalIdText = hospitalIDTextField.text, let hospitalId = Int(hospitalIdText),
            let name = nameTextField.text, !name.isEmpty,
            let bedsText = totalBedsTextField.text, let beds = Int(bedsText)
        else {
            showAlert("Error", "Please enter valid numeric values for IDs and beds.")
            return
        }
        
        let department = Department(id: id, hospitalId: hospitalId, name: name, totalBeds: beds)
        let result = dataManager.addDepartment(department)
        
        showAlert(result.0 ? "Success" : "Error", result.1)
        clearAll()
    }
    
    private func clearAll() {
        idTextField.text = ""
        nameTextField.text = ""
        totalBedsTextField.text = ""
        hospitalIDTextField.text = ""
    }
    
}
