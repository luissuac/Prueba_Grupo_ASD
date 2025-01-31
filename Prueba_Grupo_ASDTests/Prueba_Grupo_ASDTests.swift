//
//  Prueba_Grupo_ASDTests.swift
//  Prueba_Grupo_ASDTests
//
//  Created by Luis Alberto Suarez on 28/01/25.
//

import XCTest
import Alamofire
@testable import Prueba_Grupo_ASD

class Prueba_Grupo_ASDTests: XCTestCase {
    
    var service: PrincipalService!
    
    override func setUp() {
        super.setUp()
        service = PrincipalService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    //1. Prueba de que la API responde correctamente
    func testFetchUsers_Success() {
        let expectation = self.expectation(description: "API responde correctamente")
        
        service.fetchUsers { result in
            switch result {
            case .success(let users):
                XCTAssertFalse(users.isEmpty, "La lista de usuarios no debe estar vacia")
            case .failure(let error):
                XCTFail("La API falló con error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    //2. Prueba de transformación de datos desde JSON
    func testTransformacionDatos() {
        let jsonData = """
            [
                {
                    "id": 1,
                    "name": "Pepito Perez",
                    "username": "Pepito",
                    "email": "pepitoperez@gmail.com",
                    "address": {
                      "street": "Calle 31 69c-96",
                      "suite": "Apt. 1",
                      "city": "Barranquilla",
                      "zipcode": "080016",
                      "geo": {
                        "lat": "-37.3159",
                        "lng": "81.1496"
                      }
                    },
                    "phone": "123-456-7890",
                    "website": "hildegard.org",
                    "company": {
                      "name": "Empresa X",
                      "catchPhrase": "Multi-layered client-server neural-net",
                      "bs": "harness real-time e-markets"
                    }
                }
            ]
            """.data(using: .utf8)!
        
        do {
            let users = try JSONDecoder().decode([User].self, from: jsonData)
            XCTAssertEqual(users.count, 1)
            XCTAssertEqual(users.first?.name, "Pepito Perez")
            XCTAssertEqual(users.first?.email, "pepitoperez@gmail.com")
            XCTAssertEqual(users.first?.phone, "123-456-7890")
            XCTAssertEqual(users.first?.address.street, "Calle 31 69c-96")
            XCTAssertEqual(users.first?.company.name, "Empresa X")
        } catch {
            XCTFail("Error al decodificar JSON: \(error.localizedDescription)")
        }
    }
    
}
