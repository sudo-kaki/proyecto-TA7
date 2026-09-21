# language: es
Característica: Autenticación de usuarios en el sistema de pruebas

  Escenario de la estructura: Iniciar sesión con diferentes credenciales
    Dado que el usuario navega a la página de inicio de sesión
    Cuando ingresa el usuario "<usuario>" y la contraseña "<password>"
    Y hace clic en el botón de ingresar
    Entonces el sistema debe responder con el estado "<resultado>"

    Ejemplos:
      | usuario | password   | resultado |
      | admin   | Secret123! | EXITOSO   |
      | user    | wrongpass  | FALLIDO   |
      | admin   | badpass    | FALLIDO   |
