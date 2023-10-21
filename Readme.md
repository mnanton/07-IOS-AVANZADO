# Práctica IOS Avanzado
### Profesor: Javier Jardón

Enunciado
El objetivo de esta práctica es poner en práctica los contenidos vistos en el módulo. El alumno deberá crear un proyecto iOS usando Storyboard, Core Data y Tests

Para el desarrollo del proyecto, haremos uso del api rest Dragon Ball. La idea general de la app es que se pueda:
Parte obligatoria:
● Hacer log in. La información devuelta por este endpoint deberá guardarse en el Keychain.
● Listar los superhéroes.
● Mostrar un mapa con los superhéroes
● Poder consultar los detalles de un héroe en particular desde la lista de superhéroes.
● En la pantalla principal (lista de héroes) deberá existir un botón para hacer log out.

Parte opcional:
● Poder consultar los detalles de un héroe en particular desde el mapa.
● Añadir un buscador en la pantalla dónde se muestra la lista de superhéroes. Con este
buscador, el usuario podrá buscar héroes. Una vez aparezcan los resultados, el
usuario podrá consultar sus detalles.
● Añadir un botón que permita limpiar la información almacenada en el dispositivo.
Consideraciones para el desarrollo de la práctica:
1. La pantalla inicial de se mostrará al usuario cuando arranca la app será la de la lista de superhéroes.
2. Al mostrar la pantalla de superhéroes se deberá comprobar si el usuario está logueado. Si no lo está, se deberá mostrar la pantalla de login para que el usuario se loguee. Una vez se loguee, esta pantalla se cerrará y se continuará con la visualización de usuarios en la lista.
3. Al pedir la información que será mostrada, primero se deberá consultar si está almacenada en el dispositivo (core data). Si lo está, se usará esa info para mostrar. Si no lo está, se llamará al api y la información recibida deberá ser guardada en el dispositivo.
Criterios de valoración
Que el alumno aplique de manera clara y concisa los diferentes elementos impartidos en el módulo. Valorando:
● Claridad del código.
● Separación de responsabilidades.
● Reusabilidad del código.
● Elección de nombres (variables, funciones, etc).
● Número de elementos del temario aplicados, sobre todo cuando alguna funcionalidad
puede ser realizada de diferentes formas.