package com.iplacex.automation.unit; 
import com.iplacex.automation.Calculator;

import org.junit.jupiter.api.Test; 
import static org.junit.jupiter.api.Assertions.assertEquals; 

public class SumaUnitTest { @Test public void testSumaCorrecta() 
    { Calculator calc = new Calculator(); assertEquals(5, calc.sumar(2, 3), "La suma de 2 + 3 debe ser 5"); } }