// LogInViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class LogInViewController: UIViewController {
    private var logInView = LogInView()
    private var router = Router.shared
    private var userManager = UserManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = logInView
        addTargets()
    }

    private func addTargets() {
        logInView.loginButton.button.addTarget(self, action: #selector(logInnButtonPressed), for: .touchUpInside)
        logInView.haveNoAccountButton.addTarget(self, action: #selector(haveNoAccountButtonPressed), for: .touchUpInside)
    }

    @objc
    private func logInnButtonPressed() {
        if let email = logInView.emailInputView.textField.text {
            if email.isValidEmail == true {
                if userManager.isUserExist(email: email) {
                    if let password = logInView.passwordInputView.textField.text {
                        if password == userManager.getPassword(email: email) {
                            router.setRootViewController(controller: TabBarController())
                        } else {
                            presentAlert(message: "Wrong password")
                        }
                    } else {
                        presentAlert(message: "Please enter password")
                    }
                } else {
                    presentAlert(message: "There is no user with this email")
                }
            } else {
                presentAlert(message: "Something wrong with your email")
            }
        } else {
            presentAlert(message: "Please enter e-mail")
        }
    }

    @objc
    private func haveNoAccountButtonPressed() {
        router.setRootViewController(controller: SignInViewController())
    }
}
