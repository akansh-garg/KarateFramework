package com.karate.utils;

import java.io.File;

public class TestUtils {

	public static void createReportingDirectory() {
		File file = new File(Constants.REPORTING_DIRECTORY);
		if(!file.exists()) {
			file.mkdirs();
		}
	}
}
