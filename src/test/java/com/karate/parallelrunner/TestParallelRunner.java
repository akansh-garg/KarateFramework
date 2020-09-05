package com.karate.parallelrunner;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.karate.utils.Constants;
import com.karate.utils.ReportUtils;
import com.karate.utils.TestUtils;

/**
 * 
 * @author AKANSH
 * It is normal junit class we should not use @RunWith to execute feature files in parallel
 */
@KarateOptions(features = "classpath:featurefiles/parallelexecutiondemo", tags = "~@ignore")
public class TestParallelRunner {

	@BeforeClass
	public static void Initialization() {
		TestUtils.createReportingDirectory();
	}
	
	@Test
	public void executeFeatureFiles() {
		Results result =Runner.parallel(getClass(), 5,Constants.REPORTING_DIRECTORY);
		assertEquals(result.getFailCount(), 0);
	}
	
	@AfterClass
	public static void cleanUpAndReporting() {
		ReportUtils.generateReport();
	}
	
	
}
