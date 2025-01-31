//
//  PrincipalViewModel.swift
//  Prueba_Grupo_ASD
//
//  Created by Luis Alberto Suarez on 28/01/25.
//

import Foundation
import Alamofire

class PrincipalViewModel {
    private let service: PrincipalService
        var users: [User] = []
        var onUsersUpdated: (() -> Void)?
        var onError: ((String) -> Void)?

        init(service: PrincipalService = PrincipalService()) {
            self.service = service
        }

        func fetchUsers() {
            service.fetchUsers { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let users):
                        self?.users = users
                        self?.onUsersUpdated?()
                    case .failure(let error):
                        self?.onError?(error.localizedDescription)
                    }
                }
            }
        }
}
