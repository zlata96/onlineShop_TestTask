//  FirstViewController.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 10.03.2023.

import UIKit

class FirstViewController: UIViewController {
    private var signInView = SignInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = signInView
    }
}