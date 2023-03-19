// ProductsProtocol.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Moya

protocol ProductsProtocol {
    func getSales() -> SaleProducts
    func getLatestDeals() -> LatestDeals
}
