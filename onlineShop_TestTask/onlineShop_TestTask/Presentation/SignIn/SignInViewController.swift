// SignInViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class SignInViewController: UIViewController {
    private var signInView = SignInView()
    private var router = Router()

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
        router.setRootViewController(controller: TabBarController())
    }
}
