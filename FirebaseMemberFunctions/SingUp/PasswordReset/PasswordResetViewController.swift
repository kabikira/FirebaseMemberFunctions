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
            if error != nil {
                // 送信完了画面へ遷移
                print("送信完了")
            }
            self.showErrorAlert(error: error, vc: self)
        }

    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
