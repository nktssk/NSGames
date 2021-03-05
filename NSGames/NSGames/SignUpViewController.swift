//
//  SignUpViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 05.03.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "NSGames-icon")
        return iconImageView
    }()

    let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Создание аккаунта"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
    }()

    let loginTextField: PrettyTextField = {
        let textField =  PrettyTextField()
        textField.placeholder = "Логин"
        return textField
    }()

    let emailTextField: PrettyTextField = {
        let textField =  PrettyTextField()
        textField.placeholder = "Email"
        return textField
    }()

    let passwordTextField: PrettyTextField = {
        let textField =  PrettyTextField()
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        return textField
    }()

    let haveAccount: GrayLabel = {
        let label = GrayLabel()
        label.text = "Уже есть аккаунт?"
        label.font = UIFont.systemFont(ofSize: 15)
        label.tintColor = .grayLabel
        return label
    }()

    let signInButton: BlueTextButton = {
        let button = BlueTextButton()
        button.setTitle("Войдите", for: .normal)
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        return button
    }()

    let createAccountButton: BlueButton = {
        let button = BlueButton()
        button.setTitle("Создать аккаунт", for: .normal)
        return button
    }()

    let stackView = UIStackView()
    let userStackView = UIStackView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Создание аккаунта"
        initialize()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

    // MARK: - obcj func

    @objc
    private func signInButtonAction() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0, self.userStackView.frame.origin.y + self.userStackView.frame.size.height  > self.view.frame.height - keyboardSize.height {
                self.view.frame.origin.y -= (self.userStackView.frame.origin.y + self.userStackView.frame.size.height - keyboardSize.height)
            }
        }
    }

    @objc
    private func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    // MARK: - Helpers

    private func initialize() {

        userStackView.addArrangedSubview(loginTextField)
        userStackView.addArrangedSubview(emailTextField)
        userStackView.addArrangedSubview(passwordTextField)
        userStackView.distribution = .equalSpacing
        userStackView.alignment = .fill
        userStackView.axis = .vertical
        userStackView.spacing = 30
        view.addSubview(userStackView)
        userStackView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }

        view.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(userStackView.snp.top).offset(-20)
        }

        view.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(25)
            make.centerX.equalTo(self.view)
            make.width.height.equalTo(UIScreen.main.bounds.width * 0.3)
        }

        stackView.addArrangedSubview(haveAccount)
        stackView.addArrangedSubview(signInButton)
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 5
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }

        view.addSubview(createAccountButton)
        createAccountButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(stackView.snp.top).offset(-15)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }

    }

}
