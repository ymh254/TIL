package workshop.person.entity;

public class PersonEntity {
	private	String name;
	private char gender;
	private String ssn;
	private String address;
	private String phone;
	
	public PersonEntity (String name, String ssn, String address, String phone) {
		setName(name);
		setSsn(ssn);
		setAddress(address);
		setPhone(phone);
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
//		if(gender=='여'||gender=='남') {
//		this.gender = gender;
//		} else {
//			System.out.println("Wrong");
//		}
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
		if(ssn.charAt(6)=='1'||ssn.charAt(6)=='3') gender='남';
		if(ssn.charAt(6)=='2'||ssn.charAt(6)=='4') gender='여';

	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
