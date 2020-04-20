//
//  Value.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation

public struct Value: Codable {
    public let v: Double

    public init(v: Double) {
        self.v = v
    }
}
