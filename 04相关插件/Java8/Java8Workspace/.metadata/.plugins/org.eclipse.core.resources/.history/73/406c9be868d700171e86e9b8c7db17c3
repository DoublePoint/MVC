package Chap5;

import static java.util.stream.Collectors.toList;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

import org.junit.Test;

public class MainTest {

	@Test
	public void test83() {
		List<Integer> numbers = Arrays.asList(1, 2, 1, 3, 3, 0, 4, 6, 8, 10, 12, 16);
		numbers.stream().skip(2).filter(i -> i % 2 == 0).distinct().limit(9).forEach(System.out::println);
	}

	@Test
	public void test89_1() {
		List<Integer> numbers = Arrays.asList(1, 2, 1, 3, 3);
		List<Integer> list = numbers.stream().map(i -> i * i)
				// .forEach(System.out::println);
				.collect(toList());

		list.stream().forEach(System.out::println);
	}

	@Test
	public void test89_2() {
		List<Integer> numbers1 = Arrays.asList(1, 2, 3);
		List<Integer> numbers2 = Arrays.asList(3, 4);

		numbers1.stream().flatMap(i -> numbers2.stream().map(j -> new int[] { i, j })).forEach(System.out::println);
	}

	@Test
	public void test92() {
		List<Integer> someNumbers = Arrays.asList(1, 2, 3, 4, 5);
		Optional<Integer> firstSquareDivisibleByThree = someNumbers.stream().filter(x -> x % 3 == 0).findFirst(); // 9
		someNumbers.stream().filter(x -> x % 3 == 0).limit(1).forEach(System.out::println);
		System.out.println(firstSquareDivisibleByThree.get().toString());
	}

	@Test
	public void test107() {
		Stream.iterate(0, n -> n + 2).limit(10000000).forEach(System.out::println);
	}
}
