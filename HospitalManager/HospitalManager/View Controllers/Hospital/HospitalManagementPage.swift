//
//  HospitalManagementPage.swift
//  HospitalManager
//
//  Created by Mumthasir VP on 20/10/25.
//

import UIKit

class HospitalManagementPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Hospital", message: "Enter Hospital ID to delete", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Hospital ID" }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            guard let idText = alert.textFields?.first?.text,
                  let id = Int(idText),
                  let self = self else { return }
            let result = dataManager.deleteHospital(id: id)
            self.showAlert(result.0 ? "Success" : "Error", result.1)
        })
        findViewController()?.present(alert, animated: true)
    }

}
