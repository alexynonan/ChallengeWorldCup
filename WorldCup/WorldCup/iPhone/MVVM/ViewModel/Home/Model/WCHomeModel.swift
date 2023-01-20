//
//  WCHomeModel.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import UIKit

class WCHomeModel: NSObject {

    private weak var controller: UIViewController?
    private weak var clvHome: UICollectionView?

    var succesSplashToController : Closures.Success = {}

    private(set) var arrayHome: [WCHome]! {
        didSet {
            succesSplashToController()
        }
    }
    
    lazy var refreshControll: UIRefreshControl! = {
        var objRefreshControll = UIRefreshControl()
        objRefreshControll.tintColor = .white
        objRefreshControll.addTarget(self, action: #selector(self.loadService), for: .valueChanged)
        return objRefreshControll
    }()

    init(toController: UIViewController,toCollectionView: UICollectionView) {
        super.init()
        controller = toController
        clvHome = toCollectionView
        clvHome?.backgroundView = refreshControll
        self.loadService()
    }
    
    func prepareModel(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}

extension WCHomeModel {

    @objc private func loadService() {
        refreshControll.beginRefreshing()
        WCHomeBL.shared.getHome { [weak self] array in
            self?.arrayHome = array
            self?.refreshControll.endRefreshing()
        } errorService: { errorMessage in
            self.refreshControll.endRefreshing()
        }
    }
    func exitSession() {
        WCSessionBL.deleteUserSession()
        self.controller?.btnExit(nil)
    }
 
}
