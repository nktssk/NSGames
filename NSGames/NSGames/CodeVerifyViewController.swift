//
//  SignUpViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 05.03.2021.
//

import UIKit

class CodeVerifyViewController: UIViewController, UITextFieldDelegate {

    // MARK: - UI

    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый пароль"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
    }()

    let codeTextField: DataTextField = {
        let textField = DataTextField()
        textField.autocapitalizationType = .allCharacters
        textField.placeholder = "Код из письма"
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
        textField.placeholder = "Пароль еще раз"
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        return textField
    }()

    let signInButton: BlueButton = {
        let button = BlueButton()
        button.setTitle("Войти", for: .normal)
        return button
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
        title = "Пароль"
        view.backgroundColor = .white
        codeTextField.delegate = self
        passwordTextField.delegate = self
        passwordAgainTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case codeTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordAgainTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }

    // MARK: - obcj func

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

        scrollView.addSubview(topLabel)
        topLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(25)
            make.centerX.equalToSuperview()
        }

        userDataStackView.addArrangedSubview(codeTextField)
        userDataStackView.addArrangedSubview(passwordTextField)
        userDataStackView.addArrangedSubview(passwordAgainTextField)
        scrollView.addSubview(userDataStackView)
        userDataStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(topLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.85)
        }

        scrollView.addSubview(signInButton)
        signInButton.snp.makeConstraints { (make) in
            make.top.equalTo(userDataStackView.snp.bottom).offset(50)
            make.width.equalToSuperview().multipliedBy(0.85)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }

    }

}
