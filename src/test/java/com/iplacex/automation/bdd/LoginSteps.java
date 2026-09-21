package com.iplacex.automation.bdd;

import com.iplacex.automation.Calculator;
import io.cucumber.java.es.*;
import static org.junit.jupiter.api.Assertions.*;

public class LoginSteps {

    private Calculator calculator = new Calculator();
    private String usuario;
    private String password;
    private boolean loginResult;

    @Dado("que el usuario navega a la página de inicio de sesión")
    public void navegarAInicioSesion() {
        System.out.println("Navegando a formulario de login...");
    }

    @Cuando("ingresa el usuario {string} y la contraseña {string}")
    public void ingresarCredenciales(String usr, String pass) {
        this.usuario = usr;
        this.password = pass;
    }

    @Cuando("hace clic en el botón de ingresar")
    public void hacerClicEnIngresar() {
        this.loginResult = calculator.login(usuario, password);
    }

    @Entonces("el sistema debe responder con el estado {string}")
    public void verificarResultado(String resultadoEsperado) {
        if ("EXITOSO".equalsIgnoreCase(resultadoEsperado)) {
            assertTrue(loginResult, "El inicio de sesión debía ser exitoso");
        } else {
            assertFalse(loginResult, "El inicio de sesión debía fallar");
        }
    }
}
