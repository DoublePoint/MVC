package Test;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

public class UserFilter {
	public static boolean isAdult(User user){
		return user.getAge()>18;
	}
	
	public static boolean addressContain1(User user){
		return user.getAddress().contains("1");
	}
	
	 
	
	public static List<User> filUser(List<User> list,Predicate<User> p){
		
		List<User> resultList=new ArrayList<User>();
		for (User user : list) {
			if(p.test(user)){
				resultList.add(user);
			}
		}
		return resultList;
	}
}
