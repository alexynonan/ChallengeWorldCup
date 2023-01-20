//
//  WCLoginBL.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import UIKit

struct WCLoginBL {

    static let shared = WCLoginBL()
    
    private init() { }
    
    func getLogin(
        params: UISessionRegister,
        completion: @escaping Closures.Success,
        errorService: @escaping Closures.ErrorMessage
    ) {

        if params.email.isEmpty {
            errorService(MessageAlert.General.errorEmail)
            return
        }
        
        if !params.email.mailIsValid() {
            errorService(MessageAlert.General.errorEmail)
            return
        }
        
        if params.password.isEmpty {
            errorService(MessageAlert.General.errorPassword)
            return
        }

        let params: [String: Any] = ["email": params.email,
                                     "password": params.password]
        WCLoginWS.shared.getLogin(
            params: params,
            completion: { message in
                let obj = WCUser()
                obj.session_token = message
                
                if WCSessionBL.saveSession(obj) {
                    completion()
                } else {
                    errorService(MessageAlert.General.errorSession)
                }
            }, errorService: errorService
        )
    }
}
