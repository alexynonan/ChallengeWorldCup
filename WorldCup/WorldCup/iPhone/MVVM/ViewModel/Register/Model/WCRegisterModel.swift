//
//  WCRegisterModel.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import CLDUtilities

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
        name: String?,
        email: String?,
        password: String?,
        passwordConfirm: String?,
        completion: @escaping Closures.Success
    ){
        let params = UISessionRegister(
            name: name ?? "",
            email: email ?? "",
            password: password ?? "",
            confirmPassword: passwordConfirm ?? ""
        )

        WCRegisterBL.shared.sendRegister(params: params) { [weak self] in
            guard let self = self else { return }
            completion()
            self.controller?.performSegue(
                withIdentifier: Segues.homeViewController,
                sender: nil
            )
        } errorService: { [weak self] errorMessage in
            guard let self = self else { return }
            completion()
            let cancel = CSAlertButton(title: MessageAlert.General.agreeButton)
            self.controller?.showSystemAlertGeneral(
                MessageAlert.General.titleButton,
                message: errorMessage,
                cancel: cancel,
                withCompletion: nil
            )
        }

    }
    
}
