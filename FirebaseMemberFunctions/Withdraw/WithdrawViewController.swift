//
//  WithdrawViewController.swift
//  FirebaseMemberFunctions
//
//  Created by koala panda on 2023/07/26.
//

import UIKit
import Firebase

class WithdrawViewController: UIViewController {

    @IBAction func didTapWithdrawButton(_ sender: Any) {
        Auth.auth().currentUser?.delete() { [weak self] error in
            guard let self = self else { return }
            if error != nil {
                // 非ログイン画面へ
                print("退会成功")
            }
            self.showErrorAlert(error: error, vc: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    



}
