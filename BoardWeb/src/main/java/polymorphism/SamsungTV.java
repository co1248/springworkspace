package polymorphism;

public class SamsungTV implements TV {
	
	private Speaker speaker; //의존
	private int price;
	
//	public SamsungTV() {
//		System.out.println("SamsungTV(1)객체생성");
//	}
//	public SamsungTV(Speaker speaker) {
//		System.out.println("SamsungTV(2)객체생성");
//		this.speaker = speaker;
//	}
//	public SamsungTV(Speaker speaker, int price) {
//		System.out.println("SamsungTV(3)객체생성");
//		this.speaker = speaker;
//		this.price = price;
//	}

	public void setSpeaker(Speaker speaker) {
		System.out.println("setSpeaker() 호출");
		this.speaker = speaker;
	}
	public void setPrice(int price) {
		System.out.println("setPrice() 호출");
		this.price = price;
	}

	public void powerOn() {
		System.out.println("SamsungTV---전원 켠다. (가격 :" + price + ")");
	}
	
	public void powerOff() {
		System.out.println("SamsungTV---전원 끈다.");
	}
	public void volumUp() {
		//speaker = new SonySpeaker();
		speaker.volumUp();
	}
	public void volumDown() {
		//speaker = new SonySpeaker();
		speaker.volumDown();
	}
}
