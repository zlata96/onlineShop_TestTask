//  LogInViewController.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 10.03.2023.

import UIKit

class LogInViewController: UIViewController {
    private var logInView = LogInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = logInView
    }
}
