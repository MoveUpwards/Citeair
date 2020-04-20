//
//  ApiService.swift
//  
//
//  Created by Loïc GRIFFIE on 20/04/2020.
//

import Foundation
import Offenbach

/// Responsible for requesting the API
final public class ApiService: Client {
    public static let `default` = ApiService()

    internal required init() { }
}
