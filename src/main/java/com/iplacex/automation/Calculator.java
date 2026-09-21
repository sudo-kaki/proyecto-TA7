package com.iplacex.automation;

public class Calculator {

    public int sumar(int a, int b) {
        return a + b;
    }

    public int restar(int a, int b) {
        return a - b;
    }

    public boolean login(String username, String password) {
        if (username == null || password == null) {
            return false;
        }
        return username.equals("admin") && password.equals("Secret123!");
    }
}
