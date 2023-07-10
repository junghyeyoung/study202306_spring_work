package com.example.hello2;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
/*
	어떤 객체를 spring 이 생성해서 관리할지 설명(bean 설정)
	xml 문서로 설정하면 bean 설정을  class 기반으로 한다.
*/

import com.example.hello2.pc.Computer;
import com.example.hello2.pc.Cpu;
import com.example.hello2.util.Remocon;
import com.example.hello2.util.RemoconImpl;
import com.example.hello2.util.TvRemocon;
@Configuration
public class JavaConfig {
	
	/*
	 *	이 메소드에서 리턴되는 객체를 spring 이 관리하는 bean 이 되도록 한다.
	 *	아래의 메소드는 xml 문서에서 <bean id="myCar" class="com.example.demo.Car" /> 와 같다. 
	*/
	
	@Bean
	public Car myCar() {	
		System.out.println("myCar() 메소드 호출됌");
		Car c1=new Car();
		return c1;
	}
	
	//Remocon 인터페이스 type 이 spring 이 관리하는 bean 이 되도록 설정해 보세요.
	@Bean
	public Remocon myRemocon() {  // bean의 이름은 => myRemocon
		System.out.println("myRemocon() 메소드 호출됌");
		Remocon r1=new RemoconImpl();
		return r1;
	}
	
	@Bean
	public Remocon tvRemocon() {  // bean의 이름은 => tvRemocon
		Remocon r1=new TvRemocon();
		return r1;
	}
	
	@Bean
	public Cpu getCpu() {
		return new Cpu();
	}
	
	@Bean
	public Computer myComputer() {
		//생성자에 또다른 bean 의 참조값을 필요하면 메소드를 호출해서 얻어내면 된다.
		Computer c1=new Computer(getCpu());
		return c1;
	}
}
