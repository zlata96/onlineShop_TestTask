// SignInViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class SignInViewController: UIViewController {
    private var signInView = SignInView()
    private var router = Router()
    private var userManager = UserManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = signInView
        addTargets()
    }

    private func addTargets() {
        signInView.alreadyLoginButton.addTarget(self, action: #selector(alreadyLoginButtonPressed), for: .touchUpInside)
        signInView.signInButton.button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
    }

    @objc
    private func alreadyLoginButtonPressed() {
        router.setRootViewController(controller: LogInViewController())
    }

    @objc
    private func signInButtonPressed() {
        guard let email = signInView.emailInputView.textField.text else {
            presentAlert(message: Texts.enterEmail)
            return
        }
        guard email.isValidEmail else {
            presentAlert(message: Texts.wrongEmail)
            return
        }
        guard !userManager.isUserExist(email: email) else {
            presentAlert(message: Texts.userExist)
            return
        }
        userManager.saveUser(
            email: signInView.emailInputView.textField.text ?? "",
            firstName: signInView.firstNameInputView.textField.text ?? "",
            lastName: signInView.lastNameInputView.textField.text ?? "",
            password: signInView.passwordInputView.textField.text ?? ""
        )
        router.setRootViewController(controller: TabBarController())
    }
}
