//
//  WCLoginViewController.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import UIKit

class WCLoginViewController: UIViewController {

    @IBOutlet weak private var txtEmail: UITextField!
    @IBOutlet weak private var txtPassword: UITextField!
    @IBOutlet weak private var loadActivity: UIActivityIndicatorView!

    private var loginModel: WCLoginModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func btnRegister(_ sender: UIButton) {
        guard loginModel != nil else { return }
        loginModel.toRegister()
    }

    @IBAction private func btnLoginSession(_ sender: UIButton) {
        guard loginModel != nil else { return }
        loadActivity.startAnimating()
        loginModel.sessionLogin(
            email: txtEmail.text,
            password: txtPassword.text
        ) {
            loadActivity.stopAnimating()
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard loginModel != nil else { return }
        loginModel.prepareModel(for: segue, sender: sender)
    }
}

extension WCLoginViewController {

    private func loadModel() {
        loginModel = WCLoginModel(toController: self)
    }
}
