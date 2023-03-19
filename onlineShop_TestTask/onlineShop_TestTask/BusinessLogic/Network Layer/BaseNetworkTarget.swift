import Foundation
import Moya

protocol BaseNetworkTarget: TargetType {}

extension BaseNetworkTarget {
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

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
        return Data()
    }
}
