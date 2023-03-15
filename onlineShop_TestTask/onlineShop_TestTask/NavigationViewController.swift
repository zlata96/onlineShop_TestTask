//  NavigationViewController.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 13.03.2023.

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }

    private func setupStyle() {
        view.backgroundColor = .white
    }
}
