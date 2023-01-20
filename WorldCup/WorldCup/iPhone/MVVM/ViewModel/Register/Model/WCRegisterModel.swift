//
//  WCRegisterModel.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import UIKit

class WCRegisterModel: NSObject {

    private weak var controller: UIViewController?

    var succesSplashToController : Closures.Success = {}

    init(toController: UIViewController) {
        super.init()
        controller = toController
        
    }

}

extension WCRegisterModel {

    func registerUser(
        email: String?,
        password: String?,
        passwordConfirm: String?,
        completion: Closures.Success
    ){
        
    }
    
}
