// ProductCategoriesCollectionViewModel.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

struct ProductCategoriesCollectionViewModel {
    var name: String
    var iconImage: UIImage?

    static let allItems = [
        ProductCategoriesCollectionViewModel(name: Texts.phones, iconImage: UIImage(named: "phonesIcon")),
        ProductCategoriesCollectionViewModel(name: Texts.headphones, iconImage: UIImage(named: "headphonesIcon")),
        ProductCategoriesCollectionViewModel(name: Texts.games, iconImage: UIImage(named: "gamesIcon")),
        ProductCategoriesCollectionViewModel(name: Texts.cars, iconImage: UIImage(named: "carsIcon")),
        ProductCategoriesCollectionViewModel(name: Texts.furniture, iconImage: UIImage(named: "furnitureIcon")),
        ProductCategoriesCollectionViewModel(name: Texts.kids, iconImage: UIImage(named: "kidsIcon"))
    ]
}
