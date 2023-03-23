// ProductsService.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Foundation
import Moya

class ProductsService: ProductsProtocol {
    var provider: MoyaProvider<ProductsAPI>

    init(provider: MoyaProvider<ProductsAPI> = MoyaProvider()) {
        self.provider = provider
    }

    func getSales(completion: @escaping ([SaleProduct]) -> Void) {
        provider.request(.getSales) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(SaleProducts.self, from: response.data)
                    completion(results.saleProducts)
                } catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }

    func getLatestDeals(completion: @escaping ([LatestDeal]) -> Void) {
        provider.request(.getLatestDeals) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(LatestDeals.self, from: response.data)
                    completion(results.latestDeals)
                } catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
