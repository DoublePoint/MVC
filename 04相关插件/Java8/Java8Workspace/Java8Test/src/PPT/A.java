package PPT;


@FunctionalInterface
public interface A {
	
	public void test();
	
	default void hello() {
		System.out.println("Hello from A");
	}
}
