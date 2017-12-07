package PPT;

@FunctionalInterface
public interface TemplateInterface<T> {
	public T getValue(T t);
}
