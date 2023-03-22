// ProfileItemsViewModel.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

struct ProfileCellModel {
    var name: String
    var iconImage: UIImage?
    var state: ProfileCellState

    static let allItems = [
        ProfileCellModel(name: "Trade store", iconImage: UIImage(named: "tradeIcon"), state: .pointer),
        ProfileCellModel(name: "Payment method", iconImage: UIImage(named: "tradeIcon"), state: .pointer),
        ProfileCellModel(name: "Balance", iconImage: UIImage(named: "tradeIcon"), state: .text(value: "$ 1593")),
        ProfileCellModel(name: "Trade history", iconImage: UIImage(named: "tradeIcon"), state: .pointer),
        ProfileCellModel(name: "Restore Purchase", iconImage: UIImage(named: "restoreIcon"), state: .pointer),
        ProfileCellModel(name: "Help", iconImage: UIImage(named: "helpIcon"), state: .none),
        ProfileCellModel(name: "Log out", iconImage: UIImage(named: "logOutIcon"), state: .none),
    ]
}
