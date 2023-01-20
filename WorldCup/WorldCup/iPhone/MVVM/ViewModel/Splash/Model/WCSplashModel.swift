//
//  WCSplashModel.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import UIKit

class WCSplashModel: NSObject {

    private weak var controller: UIViewController?

    var succesSplashToController : Closures.Success = {}

    init(toController: UIViewController) {
        super.init()
        controller = toController
        self.toHomeController()
    }
    
    func prepareModel(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? WCLoginViewController {
//            guard let obj = sender as? FoodBE else { return }
//            controller.didRecieveDataFood(objFood: obj)
        }
    }
}

extension WCSplashModel {

    private func toHomeController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.succesSplashToController()
            self.controller?.performSegue(
                withIdentifier: Segues.loginViewController,
                sender: nil
            )
        }
    }
    
    
}
