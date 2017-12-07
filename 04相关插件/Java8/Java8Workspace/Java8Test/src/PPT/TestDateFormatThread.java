package PPT;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class TestDateFormatThread extends Thread {
	public static SimpleDateFormat dFormat = new SimpleDateFormat("yyyyMMdd");

	@Override
	public void run() {
		try {
			System.out.println(dFormat.parse("20171206"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		for (int i = 0; i < 5; i++) {
			TestDateFormatThread dateFormatThread = new TestDateFormatThread();
			dateFormatThread.start();
		}
	}
}
