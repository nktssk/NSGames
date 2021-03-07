//
//  SignUpViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 05.03.2021.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    // MARK: - UI

    let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "NSGames-icon")
        return iconImageView
    }()

    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Создание аккаунта"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
    }()

    let loginTextField: DataTextField = {
        let textField = DataTextField()
        textField.placeholder = "Логин"
        return textField
    }()

    let emailTextField: DataTextField = {
        let textField = DataTextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        return textField
    }()

    let passwordTextField: DataTextField = {
        let textField = DataTextField()
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        return textField
    }()

    let passwordAgainTextField: DataTextField = {
        let textField = DataTextField()
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        return textField
    }()

    let haveAccount: GrayLabel = {
        let label = GrayLabel()
        label.text = "Уже есть аккаунт?"
        label.font = UIFont.systemFont(ofSize: 15)
        label.tintColor = .grayLabel
        return label
    }()

    var signInButton: BlueTextButton = {
        let button = BlueTextButton()
        button.setTitle("Войдите", for: .normal)
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        return button
    }()

    let signUpButton: BlueButton = {
        let button = BlueButton()
        button.setTitle("Создать аккаунт", for: .normal)
        return button
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()

    let userDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()

    let scrollView = UIScrollView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        title = "Создание аккаунта"
        view.backgroundColor = .white
        loginTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordAgainTextField.delegate = self 
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordAgainTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }

    // MARK: - obcj func

    @objc
    private func signInButtonAction() {
        navigationController?.popViewController(animated: true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height + keyboardSize.height)
        }
    }

    @objc
    private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentSize = scrollView.frame.size
    }

    // MARK: - Helpers

    private func constraints() {
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        scrollView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(25)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(scrollView.snp.width).multipliedBy(0.3)
        }

        scrollView.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
        }

        userDataStackView.addArrangedSubview(loginTextField)
        userDataStackView.addArrangedSubview(emailTextField)
        userDataStackView.addArrangedSubview(passwordTextField)
        userDataStackView.addArrangedSubview(passwordAgainTextField)
        scrollView.addSubview(userDataStackView)
        userDataStackView.snp.makeConstraints { (make) in
            make.top.equalTo(signUpLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
        }

        scrollView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(userDataStackView.snp.bottom).offset(50)
            make.width.equalToSuperview().multipliedBy(0.85)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }

        stackView.addArrangedSubview(haveAccount)
        stackView.addArrangedSubview(signInButton)
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(signUpButton.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
        }

    }

}
