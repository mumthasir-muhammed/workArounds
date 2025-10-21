//
//  ListDepartments.swift
//  HospitalManager
//
//  Created by Mumthasir VP on 21/10/25.
//

import UIKit

class ListDepartments: UIViewController {

    @IBOutlet weak var listDeptTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listDepartments()
    }

    func listDepartments() {
        let departments = dataManager.getAllDepartments()
        
        if departments.isEmpty {
            listDeptTextView.text = "No departments available."
        } else {
            let formattedText = departments.map { dept in
                """
                ID: \(dept.id)
                Name: \(dept.name)
                Hospital ID: \(dept.hospitalId)
                Total Beds: \(dept.totalBeds)
                -------------------------
                """
            }.joined(separator: "\n")
            
            listDeptTextView.text = formattedText
        }
    }
}
