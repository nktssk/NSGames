//
//  ForgotPasswordViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 07.03.2021.
//

import UIKit
import SnapKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

    // MARK: - UI
    private let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = #imageLiteral(resourceName: "NSGames-icon")
        return iconImageView
    }()

    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите email"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
    }()

    private let emailTextField: DataTextField = {
        let textField = DataTextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        return textField
    }()

    private let nextButton: BlueButton = {
        let button = BlueButton()
        button.setTitle("Далее", for: .normal)
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        return button
    }()

    private let scrollView = UIScrollView()
    private let loadingView = UIActivityIndicatorView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        loadingView.isHidden = true
        title = "Восстановление пароля"
        view.backgroundColor = .white
        emailTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // MARK: - obcj func
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height + keyboardSize.height)
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentSize = scrollView.frame.size
    }

    @objc private func nextButtonAction() {
        if let text = emailTextField.text, !text.isEmpty {
            let controller = CodeVerifyViewController()
            controller.viewModel = MockCodeVerifyViewModel(service: MockCodeVerifyService())
            navigationController?.pushViewController(controller, animated: true)
        }
    }

    // MARK: - Helpers
    private func constraints() {
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        scrollView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(25)
            make.width.height.equalTo(scrollView.snp.width).multipliedBy(0.3)
        }

        scrollView.addSubview(forgotPasswordLabel)
        forgotPasswordLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
        }

        scrollView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.top.equalTo(forgotPasswordLabel.snp.bottom).offset(20)
        }

        scrollView.addSubview(nextButton)
        nextButton.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.85)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
