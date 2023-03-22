// ProfileCellModel.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

struct ProfileCellModel {
    var name: String
    var iconImage: UIImage?
    var state: ProfileCellState

    static let allItems = [
        ProfileCellModel(name: Texts.tradeStore, iconImage: UIImage(named: "tradeIcon"), state: .pointer),
        ProfileCellModel(name: Texts.paymentMethod, iconImage: UIImage(named: "tradeIcon"), state: .pointer),
        ProfileCellModel(name: Texts.balance, iconImage: UIImage(named: "tradeIcon"), state: .text(value: "$ 1593")),
        ProfileCellModel(name: Texts.tradeHistory, iconImage: UIImage(named: "tradeIcon"), state: .pointer),
        ProfileCellModel(name: Texts.restorePurchase, iconImage: UIImage(named: "restoreIcon"), state: .pointer),
        ProfileCellModel(name: Texts.help, iconImage: UIImage(named: "helpIcon"), state: .none),
        ProfileCellModel(name: Texts.logOut, iconImage: UIImage(named: "logOutIcon"), state: .none)
    ]
}
