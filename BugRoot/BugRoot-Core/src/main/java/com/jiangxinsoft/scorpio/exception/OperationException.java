package com.jiangxinsoft.scorpio.exception;

public class OperationException extends RuntimeException {
	
	private static final long serialVersionUID = 2L;

	public OperationException() {
		super();
	}

	public OperationException(String message) {
		super(message);
	}

	public OperationException(Throwable throwable) {
		super(throwable);
	}
	
	public OperationException(String message, Throwable throwable) {
		super(message, throwable);
	}

}
