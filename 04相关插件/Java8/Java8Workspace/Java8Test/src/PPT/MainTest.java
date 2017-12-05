package PPT;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import static java.util.Comparator.comparing;
import Chap1.Apple;

public class MainTest {

	public static void main(String[] args) {
		/**
		 * try1
		 */
		List<Apple> inventory = new ArrayList<>();

		List<Apple> greenApples0 = filterApplesByColor(inventory, "green");
		List<Apple> redApples0 = filterApplesByColor(inventory, "red");

		/**
		 * try4
		 */
		List<Apple> greenApples1 = filterApples(inventory, "green", 0, true);

		greenApples1.size();
		redApples0.size();

		/**
		 * try5
		 */
		List<Apple> heavyApples = filterApples(inventory, new AppleHeavyWeightPredicate());
		List<Apple> greenApples = filterApples(inventory, new AppleGreenColorPredicate());

		heavyApples.size();
		greenApples.size();

		/**
		 * try6
		 */
		List<Apple> redApples = filterApples(inventory, new ApplePredicate() {
			public boolean test(Apple apple) {
				return "red".equals(apple.getColor());
			}
		});

		redApples.size();
		/**
		 * try7
		 */

		List<Apple> result = filterApples(inventory, (Apple apple) -> "red".equals(apple.getColor()));
		List<Apple> result2 = filterApples(inventory, (Apple apple) -> 105 < apple.getWeight());

		result.size();
		result2.size();

		List<Apple> redApples8 = filter(inventory, (Apple apple) -> "red".equals(apple.getColor()));

		redApples8.size();

		Comparator<Apple> byWeight = new Comparator<Apple>() {
			public int compare(Apple a1, Apple a2) {
				return a1.getWeight().compareTo(a2.getWeight());
			}
		};

		byWeight.hashCode();

		Comparator<Apple> byWeight2 = 
				(Apple a1, Apple a2) -> a1.getWeight().compareTo(a2.getWeight());

		byWeight2.hashCode();
		
		inventory.sort((Apple a1, Apple a2)
				-> a1.getWeight().compareTo(a2.getWeight()));
		
		inventory.sort(comparing(Apple::getWeight));
	}

	public static List<Apple> filterGreenApples(List<Apple> inventory) {
		List<Apple> result = new ArrayList<Apple>();
		for (Apple apple : inventory) {
			if ("green".equals(apple.getColor())) {
				result.add(apple);
			}
		}
		return result;
	}

	public static List<Apple> filterApplesByColor(List<Apple> inventory, String color) {
		List<Apple> result = new ArrayList<Apple>();
		for (Apple apple : inventory) {
			if (apple.getColor().equals(color)) {
				result.add(apple);
			}
		}
		return result;
	}

	public static List<Apple> filterApplesByWeight(List<Apple> inventory, int weight) {
		List<Apple> result = new ArrayList<Apple>();
		for (Apple apple : inventory) {
			if (apple.getWeight() > weight) {
				result.add(apple);
			}
		}
		return result;
	}

	public static List<Apple> filterApples(List<Apple> inventory, String color, int weight, boolean flag) {
		List<Apple> result = new ArrayList<Apple>();
		for (Apple apple : inventory) {
			if ((flag && apple.getColor().equals(color)) || (!flag && apple.getWeight() > weight)) {
				result.add(apple);
			}
		}
		return result;
	}

	public static List<Apple> filterApples(List<Apple> inventory, ApplePredicate p) {
		List<Apple> result = new ArrayList<>();
		for (Apple apple : inventory) {
			if (p.test(apple)) {
				result.add(apple);
			}
		}
		return result;
	}

	public static <T> List<T> filter(List<T> list, Predicate<T> p) {
		List<T> result = new ArrayList<>();
		for (T e : list) {
			if (p.test(e)) {
				result.add(e);
			}
		}
		return result;
	}

}
