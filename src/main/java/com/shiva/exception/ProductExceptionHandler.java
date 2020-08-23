package com.shiva.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ProductExceptionHandler {
	@ExceptionHandler(value=ProductException.class)
	public String handleExceptions(){
		return "error";
	}

}
