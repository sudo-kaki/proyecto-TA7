package com.iplacex.automation.unit; 
import com.iplacex.automation.Calculator; 

import org.junit.jupiter.api.Test; 
import static org.junit.jupiter.api.Assertions.assertEquals; 

public class RestaUnitTest { @Test public void testRestaCorrecta() 
    { Calculator calc = new Calculator(); assertEquals(2, calc.restar(5, 3), "La resta de 5 - 3 debe ser 2"); } }