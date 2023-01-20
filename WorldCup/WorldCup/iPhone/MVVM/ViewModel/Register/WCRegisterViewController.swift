//
//  WCRegisterViewController.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 19/01/23.
//

import UIKit

class WCRegisterViewController: UIViewController {

    @IBOutlet weak private var txtEmail: UITextField!
    @IBOutlet weak private var txtPassword: UITextField!
    @IBOutlet weak private var txtPasswordConfirm: UITextField!
    @IBOutlet weak private var loadActivity: UIActivityIndicatorView!

    private var registerModel: WCRegisterModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func btnRegister(_ sender: UIButton) {
        guard registerModel != nil else { return }
        loadActivity.startAnimating()
        registerModel.registerUser(
            email: txtEmail.text,
            password: txtPassword.text,
            passwordConfirm: txtPasswordConfirm.text
        ) {
            loadActivity.stopAnimating()
        }
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


extension WCRegisterViewController {

    private func loadModel() {
        registerModel = WCRegisterModel(toController: self)
    }
}
