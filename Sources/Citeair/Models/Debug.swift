//
//  Debug.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation

public struct Debug: Codable {
    public let sync: Date

    public init(sync: Date) {
        self.sync = sync
    }
}
