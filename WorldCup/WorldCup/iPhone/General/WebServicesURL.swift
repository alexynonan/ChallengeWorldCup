//
//  WebServicesURL.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import UIKit

struct WebServicesURL {

    static private let baseURLServices = "http://api.cup2022.ir/api/v1/"
    
    struct General {
        static let login = baseURLServices + "user/login"
        static let register = baseURLServices + "user"
        static let home = baseURLServices + "team"
    }
}
