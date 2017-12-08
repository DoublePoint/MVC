package PPT;

import java.util.Optional;

public class Car {
	private Optional<Insurance> insurance;

	public Optional<Insurance> getInsurance() {
		if (insurance == null)
			return Optional.empty();
		return insurance;
	}
}
