// ProfileItemsViewModel.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

struct ProfileCellViewModel {
    var name: String
    var iconImage: UIImage?
    var state: ProfileCellState

    static let allItems = [
        ProfileCellViewModel(name: "Trade store", iconImage: UIImage(named: "tradeIcon"), state: .pointer),
        ProfileCellViewModel(name: "Payment method", iconImage: UIImage(named: "tradeIcon"), state: .pointer),
        ProfileCellViewModel(name: "Balance", iconImage: UIImage(named: "tradeIcon"), state: .text(value: "$ 1593")),
        ProfileCellViewModel(name: "Trade history", iconImage: UIImage(named: "tradeIcon"), state: .pointer),
        ProfileCellViewModel(name: "Restore Purchase", iconImage: UIImage(named: "restoreIcon"), state: .pointer),
        ProfileCellViewModel(name: "Help", iconImage: UIImage(named: "helpIcon"), state: .none),
        ProfileCellViewModel(name: "Log out", iconImage: UIImage(named: "logOutIcon"), state: .none),
    ]
}
