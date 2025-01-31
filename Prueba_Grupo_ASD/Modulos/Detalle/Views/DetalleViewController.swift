//
//  DetalleViewController.swift
//  Prueba_Grupo_ASD
//
//  Created by Luis Alberto Suarez on 28/01/25.
//

import UIKit
import SDWebImage

class DetalleViewController: UIViewController {
    
    private let user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Detalles"
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        containerView.layer.shadowRadius = 5
        
        let avatarImageView = UIImageView()
        avatarImageView.sd_setImage(with: URL(string: "\(Constants.avatarURL)\(user.name.replacingOccurrences(of: " ", with: "+"))"), placeholderImage: UIImage(systemName: "person.circle"))
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let nameLabel = createLabel(text: user.name, font: .boldSystemFont(ofSize: 22), color: .black)
        let phoneLabel = createLabel(text: "📞 \(user.phone)", font: .systemFont(ofSize: 16), color: .darkGray)
        let emailLabel = createLabel(text: "📧 \(user.email)", font: .systemFont(ofSize: 16), color: .darkGray)
        let addressLabel = createLabel(text: "📍 \(user.address.street), \(user.address.city)", font: .systemFont(ofSize: 16), color: .darkGray)
        let companyLabel = createLabel(text: "🏢 \(user.company.name)", font: .systemFont(ofSize: 16), color: .darkGray)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, phoneLabel, emailLabel, addressLabel, companyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        
        containerView.addSubview(avatarImageView)
        containerView.addSubview(stackView)
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            containerView.heightAnchor.constraint(equalToConstant: 300),
            
            avatarImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -40),
            avatarImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    
    private func createLabel(text: String, font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
}

