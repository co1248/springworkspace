package polymorphism;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("tv") //어노테이션Annotation이 붙은 대상만 스캔의 대상이 된다. id가 tv인 빈으로 등록됨
public class LgTV implements TV  {
//	@Autowired //자동주입 타입체크를 통해 체크(동일 타입이 있으면 에러남)
//	@Qualifier("apple") //구분자
//	@Resource(name="apple") //위2개랑 같은거
	@Autowired
	private Speaker speaker;
	
	@Override
	public void powerOn() {
		// TODO Auto-generated method stub
		System.out.println("LgTV---전원 켠다.");
	}
	@Override
	public void powerOff() {
		// TODO Auto-generated method stub
		System.out.println("LgTV---전원 끈다.");
	}
	@Override
	public void volumUp() {
		// TODO Auto-generated method stub
		//System.out.println("LgTV---소리 올린다.");
		speaker.volumUp();
	}
	@Override
	public void volumDown() {
		// TODO Auto-generated method stub
		//System.out.println("LgTV---소리 내린다.");
		speaker.volumDown();
	}
}
