//
//  ListHospitals.swift
//  HospitalManager
//
//  Created by Mumthasir VP on 20/10/25.
//

import UIKit

class ListHospitals: UIViewController {
    @IBOutlet weak var hospitalTextView: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadHospitals()
    }
    
    private func loadHospitals() {
        let hospitals = dataManager.getAllHospitals()
        if hospitals.isEmpty {
            hospitalTextView.text = "No hospitals available."
        } else {
            hospitalTextView.text = hospitals.map {
                """
                ID: \($0.id)
                Name: \($0.name)
                Address: \($0.address)
                Has Emergency: \($0.hasEmergency ? "Yes" : "No")
                -------------------------
                """
            }.joined(separator: "\n")
        }
    }
}
