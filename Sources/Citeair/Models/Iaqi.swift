//
//  Iaqi.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation

public struct Iaqi: Codable {
    public let dew, h, p, t, pm10, pm25, w, wg, no2, o3: Value?

    public init(dew: Value,
                h: Value,
                no2: Value,
                o3: Value,
                p: Value,
                pm10: Value,
                pm25: Value,
                t: Value,
                w: Value,
                wg: Value) {
        self.dew = dew
        self.h = h
        self.no2 = no2
        self.o3 = o3
        self.p = p
        self.pm10 = pm10
        self.pm25 = pm25
        self.t = t
        self.w = w
        self.wg = wg
    }
}
