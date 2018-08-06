package org.javaex.ssm.exception;

public class exceptionClass extends Exception {
  private String message;


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public exceptionClass(String message) {
        super(message);
        this.message = message;
    }
}
