package com.springbook.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundAdvice {
	@Pointcut("execution(* com.springbook.biz..*Impl.*(..))")
	public void allPointcut() {
		
	}	
	@Around("allPointcut()")
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable { //반드시 매개변수 타입이 ProceedingJoinPoint여야 한다.
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		
		Object obj = pjp.proceed();
		
		stopwatch.stop();
		System.out.println("() 메소드 수행에 걸린 시간 : " + stopwatch.getTotalTimeMillis() + "(ms)초");
		return obj;
		
//		System.out.println("[BEFORE] 비즈니스 메소드 수행 전에 처리할 내용...");
//		Object returnObj = pjp.proceed(); // proceed() 포인트컷 메소드를 내부적으로 실행하는 역활
//		System.out.println("[AFTER] 비즈니스 메소드 수행 후에 처리할 내용...");
//		System.out.println(returnObj);
//		return returnObj;
	}
}
