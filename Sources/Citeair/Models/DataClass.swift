//
//  DataClass.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation

public struct DataClass: Codable {
    public let aqi: Int
    public let attributions: [Attribution]
    public let city: City
    public let dominentpol: String
    public let iaqi: Iaqi
    public let time: Time
    public let debug: Debug

    public init(aqi: Int,
                attributions: [Attribution],
                city: City,
                dominentpol: String,
                iaqi: Iaqi,
                time: Time,
                debug: Debug) {
        self.aqi = aqi
        self.attributions = attributions
        self.city = city
        self.dominentpol = dominentpol
        self.iaqi = iaqi
        self.time = time
        self.debug = debug
    }
}
