//
//  WCSplashViewController.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import UIKit

class WCSplashViewController: UIViewController {

    @IBOutlet weak private var loadActivity : UIActivityIndicatorView!

    private var modelSplash : WCSplashModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
        // Do any additional setup after loading the view.
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard modelSplash != nil else { return }
        modelSplash.prepareModel(for: segue, sender: sender)
    }

}

extension WCSplashViewController {
    
    private func loadModel() {
        loadActivity.startAnimating()
        modelSplash = WCSplashModel(toController: self)
        
        modelSplash.succesSplashToController = { [weak self] in
            guard let self = self else { return }
            self.loadActivity.stopAnimating()
        }
    }
}
