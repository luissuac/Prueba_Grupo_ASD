//
//  PrincipalViewController.swift
//  Prueba_Grupo_ASD
//
//  Created by Luis Alberto Suarez on 28/01/25.
//

import UIKit
import SDWebImage

class PrincipalViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let searchBar = UISearchBar()

    private let viewModel = PrincipalViewModel()
    private var filteredUsers: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTapGestureToDismissKeyboard()
        setupUI()
        setupBindings()
        viewModel.fetchUsers()
        
    }
    
    private func setupUI() {
                       
        // MARK: Configurar barra de busqueda
        searchBar.delegate = self
        searchBar.placeholder = "Buscar por nombre"
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .darkGray
        searchBar.tintColor = .white
        searchBar.sizeToFit()
        
        // MARK: Configurar tabla
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        tableView.tableHeaderView = searchBar
        
    }
    
    private func setupBindings() {
        viewModel.onUsersUpdated = { [weak self] in
            self?.filteredUsers = self?.viewModel.users ?? []
            self?.tableView.reloadData()
        }
        
        viewModel.onError = { error in
            print("Error: \(error)")
        }
    }

    func addTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false // Permite que otros gestos sigan funcionando
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true) // Cierra el teclado
    }

}

extension PrincipalViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let user = filteredUsers[indexPath.row]
        cell.configure(with: user)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = filteredUsers[indexPath.row]
        let detailVC = DetalleViewController(user: selectedUser)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredUsers = viewModel.users
        } else {
            filteredUsers = viewModel.users.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
