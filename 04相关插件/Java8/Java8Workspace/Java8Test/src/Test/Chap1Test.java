package Test;

import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.junit.Test;

public class Chap1Test {
	private List<User> userList;

	@Test
	public void test0() {
		// userList.sort(comparing);
	}

	@Test
	public void testFile() {
		String fileName="F:\\AllProject\\04相关插件\\Java8\\PDF截图";
		File[] hiddenFiles = new File(fileName).listFiles(new FileFilter() {
			@Override
			public boolean accept(File file) {
				return file.isHidden();
			}
		});
		for (File file : hiddenFiles) {
			System.out.println(file.getName());
		}
		
		System.out.println("------------------");
		
		File[] hiddenFiles2=new File(fileName).listFiles(File::isHidden);
		for (File file : hiddenFiles2) {
			System.out.println(file.getName());
		}
	}

	/**
	 * 谓词
	 */
	@Test
	public void test1() {
		initUserList();
		userList = UserFilter.filUser(userList, UserFilter::isAdult);
		outputUserList();
	}

	/**
	 * Lambda
	 */
	@Test
	public void test2() {
		initUserList();
		userList = UserFilter.filUser(userList, (User user) -> user.getAddress().contains("address"));
		outputUserList();
	}

	/**
	 * 泛型Filter测试
	 */
	@Test
	public void test3() {
		initUserList();
		userList = TemplateFilter.filter(userList, (User user) -> !user.getAddress().contains("address"));
		outputUserList();
	}
	
	
	@Test
	public void test14(){
		initUserList();
//		Map<Integer,List<User>> usersMap=userList.stream().filter((User user)->18>user.getAge())
//				.collect(groupingBy(User::getSex));
		outputUserList();
	}
	@Test 
	public void testTime(){
//		initUserList();
//		long startTime = System.currentTimeMillis();    //获取开始时间
//		Collections.sort(userList,new Comparator<User>() {
//			public int compare(User u1,User u2){
//				return u1.getAge()-u2.getAge();
//			}
//		});
//		long endTime = System.currentTimeMillis();    //获取结束时间
//		System.out.println(endTime-startTime+"ms");
//		long startTime2 = System.currentTimeMillis();    //获取开始时间
//		userList.stream().sorted(comparing(User::getAge));
//		long endTime2 = System.currentTimeMillis();    //获取结束时间
//		System.out.println(endTime-startTime+"ms");
	}
	private void initUserList() {
		userList = new ArrayList<User>();
		for (int i = 0; i < 1000000; i++) {
			userList.add(new User("小" + i, new Random().nextInt(100),i%2==0?1:0,"address" + i));
		}
	}

	private void outputUserList() {
		for (User user : userList) {
			System.out.println(user);
		}
	}

}
