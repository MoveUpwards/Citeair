//
//  City.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation

public struct City: Codable {
    public let geo: [Double]
    public let name: String
    public let url: String

    public init(geo: [Double], name: String, url: String) {
        self.geo = geo
        self.name = name
        self.url = url
    }
}
