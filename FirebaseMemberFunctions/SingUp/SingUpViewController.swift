//
//  ViewController.swift
//  FirebaseMemberFunctions
//
//  Created by koala panda on 2023/07/23.
//

import UIKit
import Firebase

class SingUpViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    @IBAction private func didTapSignUpButton(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let name = nameTextField.text ?? ""


        //
        singUp(email: email, password: password, name: name)

    }

    @IBOutlet private weak var didTapLoginButton: UIButton! {
        didSet {
            didTapLoginButton.addTarget(self, action: #selector(singInTap(_sender:)), for: .touchUpInside)
        }
    }

    // 新しいユーザアカウント作成
    private func singUp(email: String, password: String, name: String) {
        // この時点でFirebaseのユーザになってる
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let error = error {
                self.showErrorAlert(error: error, vc: self)
            } else if let user = result?.user {
                print("singUp")
                self.updateDisplayName(name, of: user)
            }
        }
    }
    // ユーザに表示用の名前を与える
    private func updateDisplayName(_ name: String, of user: User) {
        let request = user.createProfileChangeRequest()
        request.displayName = name
        request.commitChanges() { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                self.showErrorAlert(error: error, vc: self)
            } else {
                print("updateDisplayName")
                self.sendEmailVerification(to: user)
            }
        }
    }
    // 確認(アクティベート)メールをユーザに送る
    private func sendEmailVerification(to user: User) {
        user.sendEmailVerification() { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                self.showErrorAlert(error: error, vc: self)
            } else {
                print("sendEmailVerification")
                self.showSignUpCompletion()
            }
        }
    }

    private func showSignUpCompletion() {
        // 完了したことを表示する アラートとか?
        print("完了")
    }

    @objc private func singInTap(_sender: UIButton) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        signIn(email: email, password: password)
    }
    private func signIn(email: String, password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                if let error = error {
                    self.showErrorAlert(error: error, vc: self)
                } else if let user = authResult?.user {
                    // メールが確認されているかチェック
                    if user.isEmailVerified {
                        print("ログイン成功")
                        // ここで何かを行う (例：画面遷移)
                    } else {
                        print("メールを確認してください")
                        // エラー表示など
                    }
                }
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
    }



}

