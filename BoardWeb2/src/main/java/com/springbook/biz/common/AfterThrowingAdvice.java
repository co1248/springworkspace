package com.springbook.biz.common;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterThrowingAdvice {
	@Pointcut("execution(* com.springbook.biz..*Impl.*(..))")
	public void allPointcut() {
		
	}	
	@AfterThrowing(pointcut = "allPointcut()", throwing = "exceptionObj")
	public void exceptionLog(Exception exceptionObj) {
		System.out.println("[예외 처리] 비즈니스 로직 수행 중 예외 발생");
		if(exceptionObj instanceof IllegalArgumentException) {
			System.out.println("부적합한 값이 입력되었습니다.");
		} else if (exceptionObj instanceof NumberFormatException) {
			System.out.println("숫자 형식의 값이 아닙니다.");
		}
	}
}
