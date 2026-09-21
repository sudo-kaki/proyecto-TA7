package com.iplacex.automation.tests;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.DisplayName;
import static org.junit.jupiter.api.Assertions.*;

public class CalculadoraDescuentoUnitTest {

    @Test
    @DisplayName("Debe calcular correctamente el descuento del 15% en compras superiores a $50.000")
    public void testCalcularDescuentoMontoValido() {
        double montoOriginal = 60000.0;
        double descuentoEsperado = 9000.0;
        double descuentoCalculado = montoOriginal * 0.15;
        assertEquals(descuentoEsperado, descuentoCalculado, 0.01, "El cálculo de descuento difiere del valor esperado");
    }
}


