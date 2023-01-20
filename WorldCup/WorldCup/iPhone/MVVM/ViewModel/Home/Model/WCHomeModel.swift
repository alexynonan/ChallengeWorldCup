//
//  WCHomeModel.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import UIKit

class WCHomeModel: NSObject {

    private weak var controller: UIViewController?

    var succesSplashToController : Closures.Success = {}

    private(set) var arrayHome: [WCHome]! {
        didSet {
            succesSplashToController()
        }
    }
    
    init(toController: UIViewController) {
        super.init()
        controller = toController
        self.loadService()
    }
    
    func prepareModel(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}

extension WCHomeModel {

    func loadService() {
        WCHomeBL.shared.getHome { [weak self] array in
            self?.arrayHome = array
        } errorService: { errorMessage in
            
        }
    }
    func exitSession() {
        WCSessionBL.deleteUserSession()
        self.controller?.btnExit(nil)
    }
 
}
