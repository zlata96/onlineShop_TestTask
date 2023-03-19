//
//  ProductProtocol.swift
//  onlineShop_TestTask
//
//  Created by Zlata  on 19.03.2023.
//

import Moya

protocol ProductsProtocol {
    func getSales() -> SaleProducts
    func getLatestDeals() -> LatestDeals
}
