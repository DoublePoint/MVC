package TestFunctionRef;

public class Maintest {
	public static void main(String[] args) {
		String s1 = "s1";
		String s2 = "s2";
		String s3 = "s3";

		System.out.println(combine(s1, s2, s3, (t1,t2,t3)->(t1+t2+t3).toString()));
		System.out.println(combine(s1, s2, s3, CombineHelper::combine));
		
		int i1=0;
//		System.out.println(combine2(s1, i1, CombineHelper::combineIntString));
		System.out.println(combine2(s1, i1, (i,s)->s.substring(i)));
//		System.out.println(combine2(s1, i1, String::substring));
		
		System.out.println(combine3(s1, i1, (s,i)->s.substring(i)));
		System.out.println(combine3(s1, i1, String::substring));
	}

	public static String combine(String s1, String s2, String s3, Test1<String> t1) {
		return t1.combine(s1, s2, s3);
	}

	public static String combine2(String s1, int i1, Test2<Integer,String> t2) {
		return t2.combine(i1,s1);
	}
	public static String combine3(String s1, int i1, Test3<String,Integer> t3) {
		return t3.combine(s1, i1);
	}
}
