//
//  ViewController.swift
//  Home_4month_5_TEST
//
//  Created by A LINA on 27/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var backImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "back")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var  textLbl = MakerView().makerLabel(text: "Create New Password 🔐", size: 30, weight: .bold)
    
    private lazy var descriptionTextLbl = MakerView().makerLabel(text: "Enter your new password. If you forget it, then you have to do forgot password.", size: 18, weight: .light)
    
    
    private lazy var passwordLbl = MakerView().makerLabel(text: "Password", size: 14, weight: .bold)
    
    
    private lazy var passwordTF: UITextField = {
        let textField = MakerView().makeTextField(placeholder: "Enter Password",size: 18, isSecureTextEntry: true)
        let showHideButton = UIButton(type: .custom)
        textField.isSecureTextEntry = true
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        let eyeImage = UIImage(systemName: "eye.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        rightView.setBackgroundImage(eyeImage, for: .normal)
        textField.isUserInteractionEnabled = true
        rightView.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        rightView.tag = 0
        textField.rightView = rightView
        textField.rightViewMode = .always
        textField.tag = 0
        textField.addTarget(self, action: #selector(enabledButton), for: .touchUpInside)
        return textField
    }()
    
    
    
    private lazy var confirmPasswordLbl = MakerView().makerLabel(text: "Confirm Password",size: 14, weight: .bold, textColor: .black)
    
    private lazy var confirmPasswordTF: UITextField = {
        let textField = MakerView().makeTextField(placeholder: "Confirm Password",size: 18, isSecureTextEntry: true)
        let showHideButton = UIButton(type: .custom)
        textField.isSecureTextEntry = true
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        let eyeImage = UIImage(systemName: "eye.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        rightView.setBackgroundImage(eyeImage, for: .normal)
        textField.isUserInteractionEnabled = true
        rightView.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        rightView.tag = 1
        textField.rightView = rightView
        textField.rightViewMode = .always
        textField.tag = 1
        textField.addTarget(self, action: #selector(enabledButton), for: .editingChanged)
        return textField
    }()
    
    
    private lazy var checkBtn: UIButton = {
        let view = UIButton(type: .custom)
        let image = UIImage(systemName: "square")
        view.setImage(image, for: .normal)
        view.tintColor = .systemRed
        view.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        view.tintColor = .systemRed
        view.addTarget(self, action: #selector(checkBtnTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    private lazy var checkLbl = MakerView().makerLabel(text: "Remember Me", size: 20, weight: .medium,textColor: .black)
    
    
    
    private lazy var continueBtn = MakerView().makerButton(title: "Continue", titleFont: .systemFont(ofSize: 18, weight: .medium),backgroundColor: .systemGray, cornerRadius: 20, isEnable: false)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        checkBtn.isSelected = false
        setUpUI()
        
    }
    
    private func setUpUI() {
        view.addSubview(backImage)
        view.addSubview(textLbl)
        view.addSubview(descriptionTextLbl)
        view.addSubview(passwordLbl)
        view.addSubview(passwordTF)
        view.addSubview(confirmPasswordLbl)
        view.addSubview(confirmPasswordTF)
        view.addSubview(checkBtn)
        view.addSubview(checkLbl)
        view.addSubview(continueBtn)
        
        
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backImage.heightAnchor.constraint(equalToConstant: 20),
            backImage.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            textLbl.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 45),
            textLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            textLbl.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
        NSLayoutConstraint.activate([
            descriptionTextLbl.topAnchor.constraint(equalTo: textLbl.bottomAnchor, constant: 15),
            descriptionTextLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionTextLbl.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            passwordLbl.topAnchor.constraint(equalTo: descriptionTextLbl.bottomAnchor, constant: 20),
            passwordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordLbl.heightAnchor.constraint(equalToConstant: 22),
        ])
        
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: passwordLbl.bottomAnchor, constant: 5),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordLbl.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 15),
            confirmPasswordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            confirmPasswordLbl.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordTF.topAnchor.constraint(equalTo: confirmPasswordLbl.bottomAnchor, constant: 5),
            confirmPasswordTF.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor),
            confirmPasswordTF.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),
            confirmPasswordTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            checkBtn.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 18),
            checkBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            checkBtn.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            checkLbl.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 18),
            checkLbl.leadingAnchor.constraint(equalTo: checkBtn.leadingAnchor, constant: 40),
            checkLbl.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        
        NSLayoutConstraint.activate([
            continueBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            continueBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        continueBtn.addTarget(self, action: #selector(continueBtnIsTapped), for: .touchUpInside)
    }
    
    
    @objc func checkBtnTapped() {
        checkBtn.isSelected.toggle()
    }
    
    @objc func continueBtnIsTapped() {
        
        guard check() else {
            return
        }
        
        
        guard continueBtn.isEnabled else {
            return
        }
        
        let vc = NotificationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @objc func hideText(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
        case 1:
            confirmPasswordTF.isSecureTextEntry = !confirmPasswordTF.isSecureTextEntry
        default:
            break
        }
    }
    
    @objc func enabledButton(_ sender: UITextField) {
        guard let password = passwordTF.text, let confirmPassword = confirmPasswordTF.text else { return }
        
        if password.count >= 4 && confirmPassword.count >= 4, password == confirmPassword {
            continueBtn.isEnabled = true
            continueBtn.backgroundColor = .red
        } else {
            continueBtn.isEnabled = false
            continueBtn.backgroundColor = .darkGray
        }
    }
    
    
    private func check() -> Bool {
        guard let password = passwordTF.text, !password.isEmpty,
              let confirmPassword = confirmPasswordTF.text, !confirmPassword.isEmpty else {
            setIncorrectStyle()
            passwordLbl.text = "Заполните, пожалуйста"
            return false
        }
        
        return true
    }
    
    private func setIncorrectStyle() {
        passwordLbl.textColor = .red
        
        confirmPasswordTF.layer.borderWidth = 1
        confirmPasswordTF.layer.borderColor = UIColor.red.cgColor
        
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.red.cgColor
        
    }
    
}
