//
//  WaqiEnv.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation
import Offenbach

extension ApiEnvironment {
    public var description: String {
        switch self {
        case .develop:
            return "Develop"
        case .staging:
            return "Staging"
        case .production:
            return "Production"
        }
    }
}

final class WaqiEnv: Config {
    override var baseURL: String {
        switch env {
        case .develop:
            return "http://localhost:8080"
        case .staging:
            return "https://api.waqi.info"
        case .production:
            return "https://api.waqi.info"
        }
    }
}
