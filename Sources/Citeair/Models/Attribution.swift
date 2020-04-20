//
//  Attribution.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation

public struct Attribution: Codable {
    public let url: String
    public let name: String
    public let logo: String?

    public init(url: String, name: String, logo: String?) {
        self.url = url
        self.name = name
        self.logo = logo
    }
}
