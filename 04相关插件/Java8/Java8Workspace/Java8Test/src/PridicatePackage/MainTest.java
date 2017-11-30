package PridicatePackage;

import java.util.ArrayList;
import java.util.List;

import Test.User;

public class MainTest {

	public static void main(String[] args) {
		List<User> list=new ArrayList<User>();
		list.add(new User("111", 1, 1, "adress1"));
		list.add(new User("222", 2, 1, "adress2"));
		filterUser(list, (User user2)->user2.getAge()>1);
//		filterUser(list, ()->true);
	}

	public static void filterUser(List<User> userList,IPredicate p){
		for (User user : userList) {
			if(p.test123(user)){
				System.out.println(user.toString());
			}
//			if(p.test()){
//				System.out.println(user.toString());
//			}
			
		}
		
	}
}
