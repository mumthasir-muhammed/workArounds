//
//  Helper.swift
//  HospitalManager
//
//  Created by Mumthasir VP on 20/10/25.
//

import UIKit

extension UIViewController {
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let next = responder?.next {
            if let vc = next as? UIViewController { return vc }
            responder = next
        }
        return nil
    }

    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        findViewController()?.present(alert, animated: true)
    }
}
