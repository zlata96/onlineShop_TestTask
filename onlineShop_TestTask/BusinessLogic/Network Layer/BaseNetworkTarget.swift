// BaseNetworkTarget.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Foundation
import Moya

// MARK: - BaseNetworkTarget

protocol BaseNetworkTarget: TargetType {}

extension BaseNetworkTarget {
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }

    var baseURL: URL {
        guard let url = URL(string: "https://run.mocky.io/v3/") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }

    var sampleData: Data {
        Data()
    }
}
