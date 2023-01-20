//
//  WCRegisterBL.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import UIKit

struct WCRegisterBL {

    static let shared = WCRegisterBL()
    
    private init() { }
    
    func sendRegister(
        params: UISessionRegister,
        completion: @escaping Closures.Success,
        errorService: @escaping Closures.ErrorMessage
    ) {
        
        if params.name.isEmpty {
            errorService(MessageAlert.General.errorName)
            return
        }

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

        if params.confirmPassword.isEmpty {
            errorService(MessageAlert.General.errorPassword)
            return
        }

        if params.password != params.confirmPassword {
            errorService(MessageAlert.General.errorConfirmPassword)
            return
        }
        let params: [String: Any] = ["email": params.email,
                                     "name": params.name,
                                     "password": params.password,
                                     "passwordConfirm": params.confirmPassword]

        WCRegisterWS.shared.sendRegister(
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
