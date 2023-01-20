//
//  WCLoginModel.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import CLDUtilities

class WCLoginModel: NSObject {

    private weak var controller: UIViewController?

    var succesSplashToController : Closures.Success = {}

    init(toController: UIViewController) {
        super.init()
        controller = toController
        
    }
    
    func prepareModel(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? WCHomeViewController {
//            guard let obj = sender as? FoodBE else { return }
//            controller.didRecieveDataFood(objFood: obj)
        }
    }
}

extension WCLoginModel {

    func sessionLogin(
        email: String?,
        password: String?,
        completion: @escaping Closures.Success
    ){
        let params = UISessionRegister(
            name: "",
            email: email ?? "",
            password: password ?? "",
            confirmPassword: ""
        )
        WCLoginBL.shared.getLogin(
        params: params
        ) { [weak self] in
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

    func toRegister() {
        self.controller?.performSegue(
            withIdentifier: Segues.registerViewController,
            sender: nil
        )
    }
    
}
