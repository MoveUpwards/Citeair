//
//  Welcome.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation

// MARK: - Welcome
public struct Welcome: Codable {
    public let status: String
    public let data: DataClass

    public init(status: String, data: DataClass) {
        self.status = status
        self.data = data
    }
}
