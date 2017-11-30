package Chap3;

import java.io.BufferedReader;
import java.io.IOException;
@FunctionalInterface
public interface IFileProcessor {
	public String process(BufferedReader reader) throws IOException;
}
