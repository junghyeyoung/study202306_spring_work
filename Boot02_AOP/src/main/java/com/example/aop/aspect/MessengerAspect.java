package com.example.aop.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class MessengerAspect {
   /*
   @Around("execution(void send*(..))")
   public void checkGreeting(ProceedingJoinPoint joinPoint) throws Throwable {
      //메소드에 전달된 인자들 목록을 얻어내기
      Object[] args = joinPoint.getArgs();
      for(Object tmp: args) {
         //만약 String type이면
         if(tmp instanceof String) {
            //원래 type으로 casting
            String msg = (String)tmp;
            System.out.println("aspect에서 읽어낸 내용: " + msg);
            if(msg.contains("드르렁")) {
               System.out.println("자면 안돼용");
               return;   //메소드 종료
            }
         }
      }
      //aspect가 적용된 메소드가 호출되기 직전에 할 작업은 proceed() 호출 전에 한다
      
      //proceed()를 호출해야 aspect가 적용된 메소드가 실행이 된다
      joinPoint.proceed();
      
      //aspect가 적용된 메소드가 호출되기 직전에 할 작업은 proceed() 호출 이후에 한다
      System.out.println("aspect가 적용돼 메소드가 리턴했습니다");
   	}
   */
   
   /*
    *  - return type은 String
    *  - get으로 시작되는 메소드
    *  - 메소드에 전달되는 인자는 없음
    *  java.lang 패키지에 있는 type은 패키지명 생략 가능
    */
   @Around("execution(String com.example.aop.util.*.get*())")
   public Object checkReturn(ProceedingJoinPoint joinPoint) throws Throwable {
      //aspect가 적용된 메소드를 수행하고 리턴되는 데이터 받아오기
      Object obj = joinPoint.proceed();
      
      //원래 type으로 casting해서 조사해 볼 수가 있다
      String a = (String)obj;
      
      //조사 후에 아예 다른 값 리턴 가능
      return "쿨쿨";
   }
}