package polymorphism;

import org.springframework.stereotype.Component;

//@Component("apple")
public class AppleSpeaker implements Speaker {

	public AppleSpeaker() {
		System.out.println("===> AppleSpeake 객체 생성");	
	}

	public void volumUp() {
		System.out.println("AppleSpeake---소리 올린다.");
	}
	public void volumDown() {
		System.out.println("AppleSpeake---소리 내린다.");
	}
}
