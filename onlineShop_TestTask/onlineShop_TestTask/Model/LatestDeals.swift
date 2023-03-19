// LatestDealsModel.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Foundation

// MARK: - Welcome

struct LatestDeals: Codable {
    let latestDeals: [LatestDeal]

    enum CodingKeys: String, CodingKey {
        case latestDeals = "latest"
    }
}

// MARK: - Latest

struct LatestDeal: Codable {
    let category, name: String
    let price: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
