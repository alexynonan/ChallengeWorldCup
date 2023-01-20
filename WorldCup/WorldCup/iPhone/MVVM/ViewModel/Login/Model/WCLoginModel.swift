//
//  WCLoginModel.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import UIKit

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
        completion: Closures.Success
    ){
        
    }

    func toRegister() {
        self.controller?.performSegue(
            withIdentifier: Segues.registerViewController,
            sender: nil
        )
    }
    
}
