//
//  Prueba_Grupo_ASDUITests.swift
//  Prueba_Grupo_ASDUITests
//
//  Created by Luis Alberto Suarez on 28/01/25.
//

import XCTest

final class Prueba_Grupo_ASDUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        // Continuar la ejecución incluso si falla una prueba
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    // Prueba de navegación entre la pantalla principal y la pantalla de detalle
    func testDetalleViewScreenNavigation() {
        let userCell = app.tables.cells.element(boundBy: 0) // Suponiendo que hay una lista de usuarios y seleccionamos el primero
        XCTAssertTrue(userCell.exists, "El primer usuario deberia existir en la lista")
        
        userCell.tap() // Simula el toque en el primer usuario
        
        // Verifica que la pantalla de detalles se mostro correctamente
        let userNameLabel = app.staticTexts["Leanne Graham"] // Aquí usas el nombre que debe aparecer en la pantalla de detalles
        XCTAssertTrue(userNameLabel.exists, "El nombre del usuario deberia aparecer en la pantalla de detalle")
        
        // Verifica si el telefono también esta presente
        let phoneLabel = app.staticTexts["1-770-736-8031 x56442"]
        XCTAssertTrue(phoneLabel.exists, "El numero de telefono deberia aparecer en la pantalla de detalle")
    }
    
    // Prueba de interacción con la barra de búsqueda
    func testSearchFunctionality() {
        let searchField = app.searchFields["Buscar por nombre"]
        XCTAssertTrue(searchField.exists, "El campo de busqueda deberia estar presente")
        
        // Simula la escritura de texto en el campo de búsqueda
        searchField.tap()
        searchField.typeText("Leanne Graham")
        
        // Verifica que el filtro funcione
        let filteredUserCell = app.tables.cells.staticTexts["Leanne Graham"]
        XCTAssertTrue(filteredUserCell.exists, "El usuario filtrado debería aparecer en la lista")
    }
}
