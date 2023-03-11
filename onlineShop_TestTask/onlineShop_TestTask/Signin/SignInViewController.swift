//
//  SignInViewController.swift.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 11.03.2023.
//

import UIKit

class SignInViewController: UIViewController {
    private var signInView = SignInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = signInView
    }
}
