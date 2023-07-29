//
//  PasswordResetViewController.swift
//  FirebaseMemberFunctions
//
//  Created by koala panda on 2023/07/25.
//

import UIKit
import Firebase

class PasswordResetViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBAction private func didTapSendButton(_ sender: Any) {
        let email = emailTextField.text ?? ""

        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            guard let self = self else { return }
            print("送信完了")
            if error != nil {
                self.showErrorAlert(error: error, vc: self)
            }
        }

    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
