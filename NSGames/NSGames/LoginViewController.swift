//
//  LoginViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 03.03.2021.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    // MARK: - UI

    let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "NSGames-icon")
        return iconImageView
    }()

    let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Войти"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
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

    let forgotPasswordButton: BlueTextButton = {
        let button = BlueTextButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.addTarget(self, action: #selector(forgotPasswordButtonAction), for: .touchUpInside)
        return button
    }()

    let haveNoAccount: GrayLabel = {
        let label = GrayLabel()
        label.text = "У вас нет аккаунта?"
        label.font = UIFont.systemFont(ofSize: 15)
        label.tintColor = .grayLabel
        return label
    }()

    let signUpButton: BlueTextButton = {
        let button = BlueTextButton()
        button.setTitle("Создайте его", for: .normal)
        button.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        return button
    }()

    let logInButton: BlueButton = {
        let button = BlueButton()
        button.setTitle("Войти", for: .normal)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Авторизация"
        initialize()
    }

    // MARK: - Objc funcs

    @objc
    private func signUpButtonAction() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }

    @objc
    private func forgotPasswordButtonAction() {
        print("test")
    }

    // MARK: - Helpers

    private func initialize() {
        let userStackView = UIStackView()
        userStackView.addArrangedSubview(emailTextField)
        userStackView.addArrangedSubview(passwordTextField)
        userStackView.distribution = .equalSpacing
        userStackView.alignment = .fill
        userStackView.axis = .vertical
        userStackView.spacing = 30
        view.addSubview(userStackView)
        userStackView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
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
            //make.bottom.greaterThanOrEqualTo(signInLabel.snp.top).offset(-15)
            make.centerX.equalTo(self.view)
            make.width.height.equalTo(UIScreen.main.bounds.width * 0.3)
        }

        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { (make) in
            make.right.equalTo(userStackView.snp.right)
            make.top.equalTo(userStackView.snp.bottom).offset(10)
        }

        let stackView = UIStackView()
        stackView.addArrangedSubview(haveNoAccount)
        stackView.addArrangedSubview(signUpButton)
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 5
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }

        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(stackView.snp.top).offset(-15)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
    }

}
