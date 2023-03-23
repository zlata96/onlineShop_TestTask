// ProductsProtocol.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Moya

protocol ProductsProtocol {
    func getSales(completion: @escaping ([SaleProduct]) -> Void)
    func getLatestDeals(completion: @escaping ([LatestDeal]) -> Void)
}
