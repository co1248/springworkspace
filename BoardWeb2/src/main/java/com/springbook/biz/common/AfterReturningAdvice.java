package com.springbook.biz.common;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterReturningAdvice {
	
	@Pointcut("execution(* com.springbook.biz..*Impl.get*(..))")
	public void getPointcut() {
		
	}
	
	@AfterReturning(pointcut = "getPointcut()", returning = "returnObj") //리턴값이 있는 함수면 리턴값을 받을 수 있다.
	public void afterLog(Object returnObj) {	
		System.out.println("[사후 처리] 비즈니스 로직 수행 후 동작");
		System.out.println("[사후 처리] " + returnObj.toString());
	}
}
