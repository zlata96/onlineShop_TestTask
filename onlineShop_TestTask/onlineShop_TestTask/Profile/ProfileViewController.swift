//  ProfileViewController.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 13.03.2023.

import UIKit

class ProfileViewController: UIViewController {
    private var profileView = ProfileView()
    private var profileItems: [String] = ["Trade store", "Payment method", "Balance", "Trade history", "Restore Purchase", "Help", "Log out"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
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

    }
}

// MARK: UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        profileItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: ProfileCell.self)
        cell.profileItemLabel.text = profileItems[indexPath.row]
        return cell
    }

}
