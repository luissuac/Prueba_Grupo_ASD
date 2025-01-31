//
//  PrincipalService.swift
//  Prueba_Grupo_ASD
//
//  Created by Luis Alberto Suarez on 29/01/25.
//

import Alamofire

class PrincipalService {
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
            AF.request(Constants.baseURL).validate().responseDecodable(of: [User].self) { response in
                switch response.result {
                case .success(let users):
                    completion(.success(users))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
