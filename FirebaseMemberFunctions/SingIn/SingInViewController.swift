//
//  SignInViewController.swift
//  FirebaseMemberFunctions
//
//  Created by koala panda on 2023/07/24.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    @IBAction func didTapSignInButton(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let user = result?.user {
                // サインイン後の画面へ遷移
                print("SignIn成功")
            }
            self.showErrorAlert(error: error, vc: self)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
