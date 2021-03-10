//
//  LoginViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 03.03.2021.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    // MARK: - MVVM properties
    var viewModel: SignInViewModel?

    // MARK: - UI
    let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = #imageLiteral(resourceName: "NSGames-icon")
        return iconImageView
    }()

    let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Войти"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
    }()

    let emailTextField: DataTextField = {
        let textField = DataTextField()
        textField.placeholder = "Email"
        return textField
    }()

    let passwordTextField: DataTextField = {
        let textField = DataTextField()
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
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

    let signInButton: BlueButton = {
        let button = BlueButton()
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
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

    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас нет аккаунта?"
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.numberOfLines = 2
        label.textColor = .red
        return label
    }()

    let scrollView = UIScrollView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        bindData()
        title = "Авторизация"
        //view.backgroundColor = .white
        emailTextField.delegate = self
        passwordTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()

        default:
            textField.resignFirstResponder()
        }
        return false
    }

    // MARK: - Objc Methods
    @objc private func signUpButtonAction() {
        let controller = SignUpViewController()
        controller.viewModel = MockSignUpViewModel(service: MockSignUpService())
        navigationController?.pushViewController(controller, animated: true)
    }

    @objc private func signInButtonAction() {
        viewModel?.signIn(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }

    @objc private func forgotPasswordButtonAction() {
        navigationController?.pushViewController(ForgotPasswordViewController(), animated: true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height + keyboardSize.height)
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentSize = scrollView.frame.size
    }

    // MARK: - Helpers
    private func constraints() {
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        scrollView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview().offset(25)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(scrollView.snp.width).multipliedBy(0.3)
        }

        scrollView.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
        }

        userDataStackView.addArrangedSubview(emailTextField)
        userDataStackView.addArrangedSubview(passwordTextField)
        scrollView.addSubview(userDataStackView)
        userDataStackView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(signInLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
        }

        scrollView.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { (make: ConstraintMaker) in
            make.right.equalTo(userDataStackView.snp.right)
            make.top.equalTo(userDataStackView.snp.bottom).offset(10)
        }

        scrollView.addSubview(signInButton)
        signInButton.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(50)
            make.width.equalToSuperview().multipliedBy(0.85)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }

        stackView.addArrangedSubview(haveNoAccount)
        stackView.addArrangedSubview(signUpButton)
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
        }
    }

    private func bindData() {
        viewModel?.signInError.bind { [weak self] text in
            guard let self = self else { return }
            self.errorLabel.text = text
            self.userDataStackView.addArrangedSubview(self.errorLabel)
        }
    }
}
