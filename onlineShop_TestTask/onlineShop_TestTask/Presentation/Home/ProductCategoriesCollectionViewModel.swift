// ProductCategoriesCollectionViewModel.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

struct ProductCategoriesCollectionViewModel {
    var name: String
    var iconImage: UIImage?
    
    static let allItems = [
        ProductCategoriesCollectionViewModel(name: "Phones", iconImage: UIImage(named: "phonesIcon")),
        ProductCategoriesCollectionViewModel(name: "Headphones", iconImage: UIImage(named: "headphonesIcon")),
        ProductCategoriesCollectionViewModel(name: "Games", iconImage: UIImage(named: "gamesIcon")),
        ProductCategoriesCollectionViewModel(name: "Cars", iconImage: UIImage(named: "carsIcon")),
        ProductCategoriesCollectionViewModel(name: "Furniture", iconImage: UIImage(named: "furnitureIcon")),
        ProductCategoriesCollectionViewModel(name: "Kids", iconImage: UIImage(named: "kidsIcon")),
    ]
}
