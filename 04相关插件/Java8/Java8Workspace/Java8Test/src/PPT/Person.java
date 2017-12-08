package PPT;

import java.util.Optional;

public class Person {
	private Optional<Car> car;

	public Optional<Car> getCar() {
		if (car == null)
			return Optional.empty();
		return car;
	}
}
