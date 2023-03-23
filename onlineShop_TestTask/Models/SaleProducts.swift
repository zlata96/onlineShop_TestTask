// SaleProducts.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Foundation

// MARK: - SaleProducts

struct SaleProducts: Codable {
    let saleProducts: [SaleProduct]

    enum CodingKeys: String, CodingKey {
        case saleProducts = "flash_sale"
    }
}

// MARK: - SaleProduct

struct SaleProduct: Codable {
    let category, name: String
    let price: Double
    let discount: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}
