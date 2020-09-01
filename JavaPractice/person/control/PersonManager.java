package workshop.person.control;

import workshop.person.entity.PersonEntity;

//java PersonManager "남"args[0] "블라블라"args[1]
public class PersonManager {
	public PersonManager () {
	}
	public static void main(String[] args) {
		 String title = "@@@ 인물 정보 조회 시스템 @@@";
	      
	     PersonManager pManager = new PersonManager(); // PersonManager 객체화 
	     PersonEntity[] persons = new PersonEntity[10]; // PersonEntity 자료형 배열 선언
	     pManager.printTitle(title);
	     pManager.printTitleLine(); 
	      
	     pManager.fillPersons(persons);	
	     
	     pManager.showPerson(persons);
	     
	     //다른 방법(1)
	     //Scanner 객체 생성
	     //Scanner scanner = new Scanner(system.in);
	     //System.out.println("=>성별을 입력하세요");
	     //String genderValue = scanner.next();
	     //char gender = genderValue.charAt(0);
	     //System.out.println("성별:" + gender + "은(는)" +pManager.findByGender(persons, gender) + "명 입니다.")
	     //scanner.close();
	     System.out.println("성별 : '여 '(은)는  "+pManager.findByGender(persons, '여')+"명 입니다.");
	     //다른 방법(2)
	     //main() 메서드에 전달된 아규먼트가 없으면 프로그램 종료.
	     //if(args.length <1) {
	     //		Systme.exit(-1);
	     //}
	     //char gender = args[0].charAt(0); //run configuration에서 설정해준다.
	     //System.out.println("성별:" + gender + "은(는)" + p.Manager.findByGender(persons.gender) + "명 입니다.");
	     
	     pManager.printTitleLine();
	     pManager.showPerson(persons,"김하늘");

	}
	public void fillPersons (PersonEntity[] persons) {
		persons[0] = new PersonEntity("이성호","7212121028102", "인천 계양구", "032-392-2932");
	    persons[1] = new PersonEntity("김하늘","7302132363217", "서울 강동구", "02-362-1932");
	    persons[2] = new PersonEntity("박영수","7503111233201", "서울 성북구", "02-887-1542");
	    persons[3] = new PersonEntity("나인수","7312041038988", "대전 유성구", "032-384-2223");
	    persons[4] = new PersonEntity("홍정수","7606221021341", "서울 양천구", "02-158-7333");
	    persons[5] = new PersonEntity("이미숙","7502142021321", "서울 강서구", "02-323-1934");
	    persons[6] = new PersonEntity("박성구","7402061023101", "서울 종로구", "02-308-0932");
	    persons[7] = new PersonEntity("유성미","7103282025101", "서울 은평구", "02-452-0939");
	    persons[8] = new PersonEntity("황재현","7806231031101", "인천 중구", "032-327-2202");
	    persons[9] = new PersonEntity("최철수","7601211025101", "인천 계양구", "032-122-7832");
	}
	public void showPerson (PersonEntity[] persons) {
		for(PersonEntity person: persons) {
			System.out.println( "[이름] "+
	             person.getName() +
	             "\t[성별] "+
	             person.getGender()+
	             "\t\t[전화번호] "+
	             person.getPhone()+
	             "\t[주소] "+
	             person.getAddress()
	        );
		}
	}
	public int findByGender (PersonEntity[] persons, char gender) {
	    int count = 0; 
	      
	    for(int i=0; i<persons.length; i++) {
	    	if(persons[i].getGender() == gender){
	    		count++;
	        }
	    }
	    return count;
	}
	public void showPerson (PersonEntity[] persons, String name) {
	    System.out.println("--이름 : "+"'"+name+"'"+"(으)로 찾기 결과입니다. --");
		for(PersonEntity person:persons) {
			if(person.getName().equals(name)) {
				System.out.println(
						"[이름] "+
						person.getName() +
						"\t[성별] "+
						person.getGender()+
						"\t\t[전화번호] "+
						person.getPhone()+
						"\t[주소] "+
						person.getAddress()
						);
				break;
	        }
		}
	}
	public void printTitle (String title) {
	      System.out.print('\n'+title+'\n');
	}
	public void printTitleLine() {
	      System.out.println("=".repeat(60));
	}
	public void printItemLine() {
	      System.out.println("-".repeat(60));
	}
}
