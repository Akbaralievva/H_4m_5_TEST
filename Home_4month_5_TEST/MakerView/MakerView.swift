//
//  MakerView.swift
//  Home_4month_5_TEST
//
//  Created by A LINA on 27/2/24.
//

import UIKit

class MakerView {
    
    func makerLabel(text: String = "",
                    size: CGFloat = 15,
                    weight: UIFont.Weight = .regular,
                    textColor: UIColor = .black,
                    backgroundColor: UIColor = .clear,
                    borderWidth: CGFloat = 0,
                    cornerRadius: CGFloat = 18,
                    borderColor: UIColor = .lightGray,
                    textAlignment: NSTextAlignment = .left,
                    numberOfLines: Int = 0,
                    lineBreakMode: NSLineBreakMode = .byWordWrapping,
                    translateAutoresizingMaskIntoConstraints: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight)
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.layer.borderWidth = borderWidth
        label.layer.cornerRadius = cornerRadius
        label.layer.borderColor = borderColor.cgColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = translateAutoresizingMaskIntoConstraints
        return label
    }
    
    
    func makeTextField(text: String = "",
                       placeholder: String? = nil,
                       size: CGFloat = 15,
                       weight: UIFont.Weight = .regular,
                       textColor: UIColor = .black,
                       backgroundColor: UIColor = .clear,
                       cornerRadius: CGFloat = 10,
                       textAlignment: NSTextAlignment = .left,
                       borderWidth: CGFloat = 1,
                       borderColor: UIColor = .white,
                       borderStyle: UITextField.BorderStyle = .none,
                       isSecureTextEntry: Bool = false,
                       isEnabled:Bool = true,
                       translateAutoresizingMaskIntoConstraints: Bool = false
    ) -> UITextField {
        let textField = UITextField()
        textField.text = text
        textField.placeholder = placeholder
        textField.font = .systemFont(ofSize: size, weight: weight)
        textField.textColor = textColor
        textField.backgroundColor = backgroundColor
        textField.layer.cornerRadius = cornerRadius
        textField.textAlignment = textAlignment
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        textField.borderStyle = borderStyle
        textField.isSecureTextEntry = isSecureTextEntry
        textField.isEnabled = isEnabled
        textField.translatesAutoresizingMaskIntoConstraints = translateAutoresizingMaskIntoConstraints
        return textField
    }
    
    
    
    func makerButton(title: String = "",
                     titleColor: UIColor = .white,
                     titleFont: UIFont = .systemFont(ofSize: 15),
                     image: UIImage? = nil,
                     backgroundColor: UIColor = .clear,
                     cornerRadius: CGFloat = 0,
                     contentEdgeInsets: UIEdgeInsets = .zero,
                     borderColor: UIColor? = nil,
                     borderWidth: CGFloat = 0,
                     isEnable: Bool = true,
                     translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.setImage(image, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.contentEdgeInsets = contentEdgeInsets
        button.layer.borderWidth = borderWidth
        button.isEnabled = isEnable
        button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return button
    }
    
    
}
