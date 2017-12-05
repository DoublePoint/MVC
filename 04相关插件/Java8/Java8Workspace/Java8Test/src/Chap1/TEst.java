package Chap1;

import java.util.ArrayList;
import java.util.List;

public class TEst {
	public static List<Apple> filterGreenApples(List<Apple> inventory) {
		List<Apple> result = new ArrayList<Apple>();
		for(Apple apple: inventory){
		if( "green".equals(apple.getColor() ) {
		result.add(apple);
		}
		}
		return result;
		}
}
