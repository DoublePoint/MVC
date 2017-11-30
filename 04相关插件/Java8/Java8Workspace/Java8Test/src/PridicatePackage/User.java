package PridicatePackage;

public class User {
	private String name;
	private int age;
	private int sex;
	private String address;
	public User(String name, int age,int sex,String address) {
		super();
		this.name = name;
		this.age = age;
		this.sex=sex;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isAdult(){
		return this.age>18;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", age=" + age + ", sex=" + sex + ", address=" + address + "]";
	}

}
