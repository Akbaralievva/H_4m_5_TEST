//
//  NotificationViewController.swift
//  Home_4month_5_TEST
//
//  Created by A LINA on 27/2/24.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var contacts: [Contact] = []
    
    
    private lazy var titleLbl: UILabel = MakerView().makerLabel(text: "Notification", size: 24, weight: .bold)
    
    
    private lazy var setting_icImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "setting_ic")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var first_stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 1
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var generalStackBtn: UIButton = MakerView().makerButton(title: "General", titleColor: .systemRed)
    
    private lazy var f_bottomLineLbl: UILabel = MakerView().makerLabel(text: "______________________", size: 14, weight: .bold, textColor: .red)
    
    private lazy var second_stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 1
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var systemStackBtn: UIButton = MakerView().makerButton(title: "System", titleColor: .black)
    
    private lazy var s_bottomLineLbl: UILabel = MakerView().makerLabel(text: "______________________", size: 14, weight: .bold)
    
    private let my_tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        setupTableView()
        setUpData()
        
    }
    
    private func setUpUI() {
        
        view.addSubview(titleLbl)
        view.addSubview(setting_icImg)
        view.addSubview(first_stackView)
        view.addSubview(second_stackView)
        
        first_stackView.addArrangedSubview(generalStackBtn)
        first_stackView.addArrangedSubview(f_bottomLineLbl)
        second_stackView.addArrangedSubview(systemStackBtn)
        second_stackView.addArrangedSubview(s_bottomLineLbl)
        
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            titleLbl.heightAnchor.constraint(equalToConstant: 34),
            titleLbl.widthAnchor.constraint(equalToConstant: 294)
        ])
        
        NSLayoutConstraint.activate([
            setting_icImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 62),
            setting_icImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            setting_icImg.heightAnchor.constraint(equalToConstant: 25),
            setting_icImg.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            first_stackView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20),
            first_stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            first_stackView.heightAnchor.constraint(equalToConstant: 35),
            first_stackView.widthAnchor.constraint(equalToConstant: 182)
        ])
        
        NSLayoutConstraint.activate([
            second_stackView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20),
            second_stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            second_stackView.heightAnchor.constraint(equalToConstant: 35),
            second_stackView.widthAnchor.constraint(equalToConstant: 182)
        ])
        systemStackBtn.addTarget(self, action: #selector(systemStackBtnIsTapped), for: .touchUpInside)
    }
    
    private func setupTableView() {
        view.addSubview(my_tableView)
        my_tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        my_tableView.dataSource = self
        NSLayoutConstraint.activate([
            my_tableView.topAnchor.constraint(equalTo: second_stackView.bottomAnchor, constant: 24),
            my_tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            my_tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            my_tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
    
    private func setUpData() {
        contacts = [
            Contact(image: "name0", text: "Jane Cooper has published a new recipe!", secondText: "Today | 09:24 AM", secondImage: "image0", image3: "menu_dot"),
            
            Contact(image: "name1", text: "Rochel has commented on your recipe", secondText: "1 day ago | 14:43 PM", secondImage: "image1", image3: "menu_dot"),
            
            Contact(image: "name2", text: "Brad Wigington liked your comment", secondText: "1 day ago | 09:29 AM", secondImage: "image2", image3: "menu_dot"),
            
            Contact(image: "name3", text: "Tyra Ballentine has published a new recipe!", secondText: "2 days ago | 10:29 AM", secondImage: "image3", image3: "menu_dot"),
            
            Contact(image: "name4", text: "Marci Winkles has published a new recipe!", secondText: "3 days ago | 16:52 PM", secondImage: "image4", image3: "menu_dot"),
            
            Contact(image: "name5", text: "Aileen has commented on your recipe", secondText: "4 days ago | 14:27 PM", secondImage: "image5", image3: "menu_dot"),
            
            Contact(image: "name6", text: "George has commented on your recipe", secondText: "5 days ago | 09:20 AM", secondImage: "image6", image3: "menu_dot")
        ]
        
        
        my_tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < contacts.count else {
            return UITableViewCell()
        }
        
        let contact = contacts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.configure(with: contact)
        return cell
    }
    
    @objc func systemStackBtnIsTapped() {
        let vc = SystemViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
