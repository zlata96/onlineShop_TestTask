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
        let logInnViewController = NavigationController(rootViewController: LogInViewController())
        present(logInnViewController, animated: true)
    }

    @objc
    private func signInButtonPressed() {
        if let email = signInView.emailInputView.textField.text {
            if email.isValidEmail == true, userManager.isUserExist(email: email) == false {
                userManager.saveUser(
                    email: signInView.emailInputView.textField.text ?? "",
                    firstName: signInView.firstNameInputView.textField.text ?? "",
                    lastName: signInView.lastNameInputView.textField.text ?? "",
                    password: signInView.passwordInputView.textField.text ?? ""
                )
                router.setRootViewController(controller: TabBarController())
            } else {
                presentAlert(message: "With user already exist")
            }
        } else {
            presentAlert(message: "Something wrong with your email")
        }
    }
}
