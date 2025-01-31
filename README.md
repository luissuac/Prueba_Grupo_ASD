Prueba_Grupo_ASD

Prueba_Grupo_ASD es una aplicación iOS desarrollada en Swift que consume una API REST pública, mostrando una lista de usuarios con sus datos principales y permitiendo ver más detalles al seleccionar uno. La aplicación sigue el patrón MVVM, usa Alamofire para la red, SDWebImage para la carga de imágenes y cuenta con pruebas unitarias y de UI.
Requisitos Implementados
1.	Pantalla Principal:
   
    o	Muestra una lista de usuarios obtenidos desde la API JSONPlaceholder.
  	
  	o	Cada usuario se muestra con su nombre, correo y avatar.
  	
  	o	Incluye una barra de búsqueda para filtrar usuarios por nombre.
  	
2.	Pantalla de Detalle:
   
    o	Muestra información detallada del usuario seleccionado.
  	
  	o	Incluye dirección, empresa y número de teléfono.
  	
  	o	Se muestra el número de teléfono sin botón adicional.
  	
3.	Integración de Framework Externo:
   
    o	Se usa SDWebImage para cargar imágenes de avatares desde UI Avatars.
  	
4.	Pruebas Implementadas:
   
    -	Pruebas unitarias:
  	
  		Validación de consumo de API con Alamofire.

  		Transformación de datos JSON a modelos de Swift.

  	-	Pruebas de UI:

  		Verificación de navegación entre pantallas con XCTest.

  		Interacción con la barra de búsqueda.
	
Tecnologías Usadas

  •	Swift 5
  
  •	UIKit
  
  •	MVVM Architecture
  
  •	Alamofire (Consumo de API)
  
  •	SDWebImage (Carga de imágenes)
  
  •	XCTest / XCUITest (Pruebas)


Instalación y Ejecución

1. Clonar el repositorio
  -     git clone https://github.com/luissuac/Prueba_Grupo_ASD.git
  -     cd Prueba_Grupo_ASD


Manejo de dependencias


Las dependencias se gestionan directamente con Swift Package Manager (SPM), integrado en Xcode.
Ejecutar la app en Xcode
1.	Abre Prueba_Grupo_ASD.xcworkspace en Xcode.
2.	Selecciona un simulador o dispositivo real.
3.	Presiona Cmd + R o da clic en el botón de "Run".
   
Pruebas

Ejecutar pruebas unitarias y de UI
-      Cmd + U  # Corre todas las pruebas en Xcode

Pruebas implementadas:

  •	Prueba de consumo de API: Verifica que la API responde correctamente.
  
  •	Prueba de transformación de datos: Asegura que los datos JSON se convierten a modelos Swift.
  
  •	Prueba de UI: Simula la selección de un usuario y verifica la navegación.
  
  
Estructura del Proyecto

Prueba_Grupo_ASD/
  
  │── Modulos/         	# Definición de estructuras de modulos
  
  │──── Principal/         
  
  │────── Views /		# Pantallas y componentes UI
  
  │────── ViewModels/	# Lógica de negocio (MVVM)
  
  │────── Models/       	# Definición de estructuras de modelos
  
  │──── Detalle/  
  
  │────── Views /		# Pantallas y componentes UI 
  
  │── Resources/      	# Recursos de la app
  
  │── Shared/           	# Consumo de API con Alamofire
  
  │── Util/        	# Clases utilidades compartidas
  
  │── Tests/           	# Pruebas unitarias
  
  │── UITests/         	# Pruebas de UI con XCTest



Diseño y Estilo Visual

  •	Colores aplicados a toda la app.
  
  •	Diseño moderno y limpio en todas las pantallas.
  
  •	Auto-layout para adaptabilidad en diferentes dispositivos.
  
  •	Carga asíncrona de imágenes para mejorar la experiencia del usuario.
  
  •	Altura dinámica del containerView en la pantalla de detalles para acomodar la información agregada dinámicamente.
  
Autor

  LUIS ALBERTO SUAREZ CORDERO
  
  Contacto: [luissuac@gmail.com]
    
  GitHub: [https://github.com/luissuac/]

Licencia

Puedes usarlo, modificarlo y distribuirlo libremente.
