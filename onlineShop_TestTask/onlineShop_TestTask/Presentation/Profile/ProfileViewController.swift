// ProfileViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class ProfileViewController: UIViewController {
    private var profileView = ProfileView()
    private var profileItems = ProfileCellModel.allItems
    private var router = Router.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
        title = "Profile"
        setupTableView()
    }

    private func setupTableView() {
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
    }
}

// MARK: UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Log out
        if indexPath.row == profileItems.count - 1 {
            router.setRootViewController(controller: LogInViewController())
        }
    }
}

// MARK: UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        profileItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: ProfileCell.self)
        cell.profileItemLabel.text = profileItems[indexPath.row].name
        cell.iconImageView.image = profileItems[indexPath.row].iconImage
        cell.configure(with: profileItems[indexPath.row])
        return cell
    }
}
