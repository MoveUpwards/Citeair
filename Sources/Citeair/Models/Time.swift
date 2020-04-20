//
//  Time.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation

public struct Time: Codable {
    public let s: String
    public let tz: String
    public let v: TimeInterval

    public init(s: String, tz: String, v: TimeInterval) {
        self.s = s
        self.tz = tz
        self.v = v
    }
}
