package PPT;

public class C implements A, B {
	public void hello() {
		B.super.hello();
	}
}
