// ProfileViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class ProfileViewController: NavigationController {
    private var profileView = ProfileView()
    private var profileCellsViewModel = ProfileCellViewModel.allItems

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
    func tableView(_: UITableView, didSelectRowAt _: IndexPath) {}
}

// MARK: UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        profileCellsViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: ProfileCell.self)
        cell.profileItemLabel.text = profileCellsViewModel[indexPath.row].name
        cell.iconImageView.image = profileCellsViewModel[indexPath.row].iconImage
        cell.configure(with: profileCellsViewModel[indexPath.row])
        return cell
    }
}
