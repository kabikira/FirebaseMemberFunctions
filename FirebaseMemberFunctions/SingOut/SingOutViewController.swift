//
//  SingOutViewController.swift
//  FirebaseMemberFunctions
//
//  Created by koala panda on 2023/07/26.
//

import UIKit
import Firebase

class SingOutViewController: UIViewController {

    @IBAction private func didTapSignOutButton(_ sender: Any) {
        do {
                try Auth.auth().signOut()
            print("サインアウト")
            } catch let error {
                showErrorAlert(error: error, vc: self)
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
