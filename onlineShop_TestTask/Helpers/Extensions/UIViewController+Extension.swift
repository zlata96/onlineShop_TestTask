// UIViewController+Extension.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

extension UIViewController {
    func presentAlert(message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Okay", style: .cancel))
        present(alert, animated: true)
    }
}
