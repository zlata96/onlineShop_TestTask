// TabBarController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - TabItem

private enum TabItem: CaseIterable {
    case home
    case favorites
    case cart
    case chat
    case profile

    var title: String {
        ""
    }

    var image: UIImage? {
        switch self {
        case .home: return UIImage(named: "homeIcon")
        case .favorites: return UIImage(named: "favoritesIcon")
        case .cart: return UIImage(named: "cartIcon")
        case .chat: return UIImage(named: "chatIcon")
        case .profile: return UIImage(named: "profileIcon")
        }
    }

    var selectedImage: UIImage? {
        switch self {
        case .home: return UIImage(named: "selectedHome")
        case .favorites: return UIImage(named: "selectedFavourites")
        case .cart: return UIImage(named: "selectedCart")
        case .chat: return UIImage(named: "selectedChat")
        case .profile: return UIImage(named: "selectedProfile")
        }
    }
}

// MARK: - TabBarController

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyleTabBar()
        setupTabBarItems()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    private func setupStyleTabBar() {
        tabBar.unselectedItemTintColor = .subTitle
        tabBar.tintAdjustmentMode = .normal
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.backgroundColor = .white
    }

    private func getTabBarItem(for tabItem: TabItem) -> UITabBarItem {
        UITabBarItem(title: tabItem.title, image: tabItem.image, selectedImage: tabItem.selectedImage)
    }

    private func setupTabBarItems() {
        let firstViewController = HomeViewController()
        firstViewController.tabBarItem = getTabBarItem(for: .home)

        let secondViewController = SoonViewController()
        secondViewController.tabBarItem = getTabBarItem(for: .favorites)

        let thirdViewController = SoonViewController()
        thirdViewController.tabBarItem = getTabBarItem(for: .cart)

        let fourthViewContrller = SoonViewController()
        fourthViewContrller.tabBarItem = getTabBarItem(for: .chat)

        let fifthViewController = NavigationController(rootViewController: ProfileViewController())
        fifthViewController.tabBarItem = getTabBarItem(for: .profile)

        viewControllers = [
            firstViewController,
            secondViewController,
            thirdViewController,
            fourthViewContrller,
            fifthViewController
        ]
        selectedIndex = 0
    }
}
