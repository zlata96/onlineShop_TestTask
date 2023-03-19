// ProductsAPI.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Moya

enum ProductsAPI {
    case getSales
    case getLatestDeals
}

extension ProductsAPI: BaseNetworkTarget {
    var path: String {
        switch self {
        case .getSales:
            return "a9ceeb6e-416d-4352-bde6-2203416576ac"
        case .getLatestDeals:
            return "cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getSales, .getLatestDeals:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getSales, .getLatestDeals:
            return .requestPlain
        }
    }
}
