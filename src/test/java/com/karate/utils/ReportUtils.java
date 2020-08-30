package com.karate.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ReportUtils {

	public static void generateReport() {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(Constants.REPORTING_DIRECTORY), new String[] {"json"}, true);
        final List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File(Constants.REPORTING_DIRECTORY), "KarateFramework");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();   
	}

}
