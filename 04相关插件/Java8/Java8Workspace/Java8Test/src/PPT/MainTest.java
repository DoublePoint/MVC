package PPT;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoField;
import java.util.ArrayList;
import static java.util.Comparator.comparing;
import java.util.List;
import java.util.Optional;

import Chap1.Apple;
import java.util.Comparator;
public class MainTest {

	public static void main(String[] args) {
		// /**
		// * try1
		// */
		List<Apple> inventory = new ArrayList<>();
		//
		// List<Apple> greenApples0 = filterApplesByColor(inventory, "green");
		// List<Apple> redApples0 = filterApplesByColor(inventory, "red");
		//
		// /**
		// * try4
		// */
		// List<Apple> greenApples1 = filterApples(inventory, "green", 0, true);
		//
		// greenApples1.size();
		// redApples0.size();
		//
		// /**
		// * try5
		// */
		// List<Apple> heavyApples = filterApples(inventory, new
		// AppleHeavyWeightPredicate());
		// List<Apple> greenApples = filterApples(inventory, new
		// AppleGreenColorPredicate());
		//
		// heavyApples.size();
		// greenApples.size();
		//
		// /**
		// * try6
		// */
		// List<Apple> redApples = filterApples(inventory, new ApplePredicate()
		// {
		// public boolean test(Apple apple) {
		// return "red".equals(apple.getColor());
		// }
		// });
		//
		// redApples.size();
		// /**
		// * try7
		// */
		//
		// List<Apple> result = filterApples(inventory, (Apple apple) ->
		// "red".equals(apple.getColor()));
		// List<Apple> result2 = filterApples(inventory, (Apple apple) -> 105 <
		// apple.getWeight());
		//
		// result.size();
		// result2.size();
		//
		// List<Apple> redApples8 = filter(inventory, (Apple apple) ->
		// "red".equals(apple.getColor()));
		//
		// redApples8.size();
		//
		// Comparator<Apple> byWeight = new Comparator<Apple>() {
		// public int compare(Apple a1, Apple a2) {
		// return a1.getWeight().compareTo(a2.getWeight());
		// }
		// };
		//
		// byWeight.hashCode();
		//
		// Comparator<Apple> byWeight2 = (Apple a1, Apple a2) ->
		// a1.getWeight().compareTo(a2.getWeight());
		//
		// byWeight2.hashCode();
		//
		// inventory.sort((Apple a1, Apple a2) ->
		// a1.getWeight().compareTo(a2.getWeight()));
		//
		// inventory.sort(comparing(Apple::getWeight));
		//
		// List<Dish> menu = Arrays.asList(new Dish("pork", false, 800,
		// Dish.Type.MEAT),
		// new Dish("beef", false, 700, Dish.Type.MEAT), new Dish("chicken",
		// false, 400, Dish.Type.MEAT),
		// new Dish("french fries", true, 530, Dish.Type.OTHER), new
		// Dish("rice", true, 350, Dish.Type.OTHER),
		// new Dish("season fruit", true, 120, Dish.Type.OTHER), new
		// Dish("pizza", true, 550, Dish.Type.OTHER),
		// new Dish("prawns", false, 300, Dish.Type.FISH), new Dish("salmon",
		// false, 450, Dish.Type.FISH));
		//
		// List<String> threeHighCaloricDishNames =
		//
		// menu.stream()
		//
		// .filter(d -> d.getCalories() > 300).map(Dish::getName).limit(3)
		//
		// .collect(toList());
		//
		// System.out.println(threeHighCaloricDishNames);
		//
		// List<Dish> vegetarianMenu =
		// menu.stream().filter(Dish::isVegetarian).collect(toList());
		//
		// vegetarianMenu.size();
		//
		// List<Integer> numbers = Arrays.asList(1, 2, 1, 3, 3, 2, 4);
		// numbers.stream().filter(i -> i % 2 ==
		// 0).distinct().forEach(System.out::println);
		//
		// List<Dish> dishes = menu.stream().filter(d -> d.getCalories() >
		// 300).limit(3).collect(toList());
		//
		// dishes.size();
		//
		// List<Dish> dishes2 = menu.stream().filter(d -> d.getCalories() >
		// 300).skip(2).collect(toList());
		//
		// dishes2.size();
		//
		// List<String> dishNames =
		// menu.stream().map(Dish::getName).collect(toList());
		//
		// List<Integer> dishNameLengths =
		// menu.stream().map(Dish::getName).map(String::length).collect(toList());
		//
		// List<String> words = Arrays.asList("Hello", "World");
		//
		// List<String[]> list = words.stream().map(word ->
		// word.split("")).distinct().collect(toList());
		//
		// list.stream().forEach(s ->
		// Arrays.stream(s).forEach(System.out::println));
		//
		// words.stream().map(word ->
		// word.split("")).distinct().collect(toList());
		//
		// System.out.println("-------");
		//
		// words.stream().map(word ->
		// word.split("")).flatMap(Arrays::stream).distinct().forEach(System.out::println);
		//
		// words.stream().map(word ->
		// word.split("")).map(Arrays::stream).distinct().collect(toList());
		//
		// List<String> uniqueCharacters = words.stream().map(w ->
		// w.split("")).flatMap(Arrays::stream).distinct()
		// .collect(Collectors.toList());
		//
		// int[] intArr = { 1, 2, 3 };
		// Arrays.stream(intArr);
		//
		// List<Integer> numbers2 = Arrays.asList(1, 2, 1, 3, 3, 2, 4);
		// int sum = numbers2.stream().reduce(0, (a, b) -> a + b);
		//
		// if (menu.stream().anyMatch(Dish::isVegetarian)) {
		// System.out.println("The menu is (somewhat) vegetarian friendly!!");
		// }
		//
		// boolean isHealthy = menu.stream().allMatch(d -> d.getCalories() <
		// 1000);
		//
		// boolean isHealthy2 = menu.stream().noneMatch(d -> d.getCalories() >=
		// 1000);
		//
		// Optional<Dish> dish =
		// menu.stream().filter(Dish::isVegetarian).findAny();
		//
		// LocalDate date = LocalDate.of(2017, 12, 6);
		// int year = date.getYear();
		// Month month = date.getMonth();
		// int day = date.getDayOfMonth();
		// DayOfWeek dow = date.getDayOfWeek();
		// int len = date.lengthOfMonth();
		// boolean leap = date.isLeapYear();
		//
		// LocalDate today = LocalDate.now();
		//

		LocalDateTime localDateTime = LocalDateTime.of(2017, 12, 6, 17, 15, 0);
		LocalDateTime localDateTime2 = localDateTime.withDayOfMonth(2);
		LocalDateTime localDateTime4 = localDateTime.withYear(2019);
		LocalDateTime localDateTime1 = localDateTime.plusSeconds(1);
		LocalTime localTime1 = localDateTime.toLocalTime();
		LocalTime localTime2 = localDateTime.toLocalTime().minusSeconds(1);
		boolean isLeapYear = localDateTime.withYear(2012).toLocalDate().isLeapYear();

		LocalDate localDate = localDateTime.toLocalDate();

		localDateTime.get(ChronoField.YEAR);
		localDateTime.get(ChronoField.MONTH_OF_YEAR);
		localDateTime.get(ChronoField.DAY_OF_MONTH);

		localDate.get(ChronoField.YEAR);
		localDate.get(ChronoField.MONTH_OF_YEAR);
		localDate.get(ChronoField.DAY_OF_MONTH);

		Instant instant1 = Instant.ofEpochSecond(3);
		Instant instant2 = Instant.ofEpochSecond(3, 0);
		Instant.ofEpochSecond(2, 1_000_000_000);
		Instant.ofEpochSecond(4, -1_000_000_000);

		Duration d1 = Duration.between(localTime1, localTime2);
		Duration d2 = Duration.between(localDateTime1, localDateTime2);
		Duration d3 = Duration.between(instant1, instant2);

		// System.out.println(d1.getNano());
		// System.out.println(d1.getSeconds());
		// System.out.println(d1.toMillis());

		Period tenDays = Period.between(LocalDate.of(2017, 12, 6), LocalDate.of(2017, 12, 8));

		System.out.println(tenDays.getDays());
		System.out.println(tenDays.getMonths());
		System.out.println(tenDays.getYears());

		LocalDate date = LocalDate.of(2017, 12, 6);
		System.out.println(date.format(DateTimeFormatter.BASIC_ISO_DATE));
		System.out.println(date.format(DateTimeFormatter.ISO_LOCAL_DATE));
		System.out.println(date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		LocalDate date1 = LocalDate.parse("20171206", DateTimeFormatter.BASIC_ISO_DATE);
		LocalDate date2 = LocalDate.parse("2017-12-06", DateTimeFormatter.ISO_LOCAL_DATE);

		Optional<Car> optCar = Optional.empty();

		Car car = new Car();

		Optional<Car> optCar2 = Optional.of(car);

		Optional<Car> optCar3 = Optional.ofNullable(car);

		Person person = new Person();
		// Optional<String> name =
		// optPerson.map(Person::getCar).map(Car::getInsurance).map(Insurance::getName);

		Optional<Person> optPerson = Optional.of(person);
		Optional<String> name = optPerson.flatMap(Person::getCar).flatMap(Car::getInsurance).map(Insurance::getName);

		person.getCar().flatMap(Car::getInsurance).map(Insurance::getName);

		inventory.sort(new Comparator<Apple>() {
			public int compare(Apple a1, Apple a2) {
				return a1.getWeight().compareTo(a2.getWeight());
			}
		});
		
		inventory.sort(comparing((a) -> a.getWeight()));
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
