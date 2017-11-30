package Test;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

public class TemplateFilter {
	
	public static <T> List<T> filter(List<T> list, Predicate<T> p) {

		List<T> resultList = new ArrayList<T>();
		for (T user : list) {
			if (p.test(user)) {
				resultList.add(user);
			}
		}
		return resultList;
	}
}
