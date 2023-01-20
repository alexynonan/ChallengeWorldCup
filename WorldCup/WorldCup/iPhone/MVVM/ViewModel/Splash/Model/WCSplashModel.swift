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
    }
}

extension WCSplashModel {

    private func toHomeController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.succesSplashToController()
            
            if let _ = WCSessionBL.getUserSession() {
                self.controller?.performSegue(
                    withIdentifier: Segues.homeViewController,
                    sender: nil
                )
            } else {
                self.controller?.performSegue(
                    withIdentifier: Segues.loginViewController,
                    sender: nil
                )
            }
            
        }
    }
    
}
