//
//  LoginViewController.swift
//  WalletInjector
//
//  Created by Tatsuo Ikeda on 2018/03/13.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit
import Compass

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    var presenter: LoginPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginAction(_ sender: Any) {
        guard let email = emailField.text, !email.isEmpty else {
            return errorAlert(message: "Blank Email")
        }
        guard let password = passwordField.text, !password.isEmpty else {
            return errorAlert(message: "Blank Password")
        }

        presenter.signin(email: email, password: password) { result in
            switch result {
            case .success(let signio):
                print(signio.token)
                try? Navigator.navigate(urn: "settings")

            case .error:
                self.errorAlert()
            }
        }

    }

    private func errorAlert(message: String = "Auth Failed") {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alert, animated: true, completion: nil)
    }

}
