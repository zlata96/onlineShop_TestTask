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

    @objc private func logInnButtonPressed() {
        guard let email = logInView.emailInputView.textField.text else {
            presentAlert(message: Texts.enterEmail)
            return
        }
        guard email.isValidEmail else {
            presentAlert(message: Texts.wrongEmail)
            return
        }
        guard userManager.isUserExist(email: email) else {
            presentAlert(message: Texts.noUser)
            return
        }
        guard let password = logInView.passwordInputView.textField.text else {
            presentAlert(message: Texts.enterPassword)
            return
        }
        guard password == userManager.getPassword(email: email) else {
            presentAlert(message: Texts.wrongPassword)
            return
        }
        router.setRootViewController(controller: TabBarController())
    }

    @objc
    private func haveNoAccountButtonPressed() {
        router.setRootViewController(controller: SignInViewController())
    }
}
