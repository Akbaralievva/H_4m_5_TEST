//
//  CustomTableViewCell.swift
//  Home_4month_5_TEST
//
//  Created by A LINA on 27/2/24.
//



import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let cellView: UIView = {
        let cell = UIView()
        cell.layer.cornerRadius = 16
        cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contactImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let image3: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(contactImageView)
        contentView.addSubview(secondImageView)
        contentView.addSubview(image3)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cellView.heightAnchor.constraint(equalToConstant: 84),
            
            nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -75),
            nameLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 60),
            
            timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 8),
            
            contactImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            contactImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 3),
            contactImageView.widthAnchor.constraint(equalToConstant: 48),
            contactImageView.heightAnchor.constraint(equalToConstant: 48),
            
            secondImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            secondImageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -15),
            secondImageView.widthAnchor.constraint(equalToConstant: 60),
            secondImageView.heightAnchor.constraint(equalToConstant: 60),
            
            image3.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 27),
            image3.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 5),
            image3.heightAnchor.constraint(equalToConstant: 20),
            image3.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with contact: Contact) {
        nameLabel.text = contact.text
        timeLabel.text = contact.secondText
        contactImageView.image = UIImage(named: contact.image)
        secondImageView.image = UIImage(named: contact.secondImage)
        image3.image = UIImage(named: contact.image3)
    }
    
}
