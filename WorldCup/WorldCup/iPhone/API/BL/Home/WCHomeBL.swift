//
//  WCHomeBL.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import UIKit

struct WCHomeBL {

    static let shared = WCHomeBL()
    
    private init() { }
    
    func getHome(
        completion: @escaping Closures.SuccessHome,
        errorService: @escaping Closures.ErrorMessage
    ) {
        WCHomeWS.shared.getHome(completion: completion, errorService: errorService)
    }
}
