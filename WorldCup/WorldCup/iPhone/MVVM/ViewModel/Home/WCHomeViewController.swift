//
//  WCHomeViewController.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import UIKit

class WCHomeViewController: UIViewController {

    @IBOutlet weak private var clvMundial: UICollectionView!
    
    private var modelHome: WCHomeModel!
    private var modelHomeClv: WCHomeCollectionViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func btnxitSession(_ sender: UIButton) {
        guard modelHome != nil else { return }
        modelHome.exitSession()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WCHomeViewController {

    private func loadModel() {
        modelHome = WCHomeModel(toController: self)
        
        modelHome.succesSplashToController = {
            self.modelHomeClv = WCHomeCollectionViewModel(
                toController: self,
                toCollectionView: self.clvMundial,
                toArrayHome: self.modelHome.arrayHome
            )
            self.clvMundial.dataSource = self.modelHomeClv
        }
    }
}
