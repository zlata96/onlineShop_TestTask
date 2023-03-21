// LogInViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class LogInViewController: UIViewController {
    private var logInView = LogInView()
    private var router = Router.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        view = logInView
        addTargets()
    }

    private func addTargets() {
        logInView.loginButton.button.addTarget(self, action: #selector(logInnButtonPressed), for: .touchUpInside)
    }

    @objc
    private func logInnButtonPressed() {
        if logInView.emailInputView.textField.text?.isValidEmail == true {
            router.setRootViewController(controller: TabBarController())
        } else {
            presentAlert(message: "Something wrong with your email")
        }
    }
}
