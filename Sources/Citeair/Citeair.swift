//
//  Citeair.swift
//
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Alamofire
import Foundation
import Offenbach

public final class Citeair {
    let jsonDecoder = JSONDecoder()

    public required init(with env: ApiEnvironment) {
        jsonDecoder.dateDecodingStrategy = .iso8601
        ApiService.default.set(config: WaqiEnv(env: .production, decoder: jsonDecoder))
    }

    public func datas(at lat: Double, long: Double, completion: @escaping (Result<Welcome, Error>) -> Void) {
        let route = "/feed/geo:\(lat);\(long)/"
        let parameters: Parameters = [
            "token": "95ce0f3fe5cc44290671ab31a3032306f1f4839d"
        ]

        ApiService.default.get(action: route, parameters: parameters) { result in
            completion(result)
        }
    }
}
