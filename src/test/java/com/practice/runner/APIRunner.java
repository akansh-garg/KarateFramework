package com.practice.runner;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

public class APIRunner{
	
	
@Test	
public void testParallel(){
	Results result = Runner.path("features/").tags("@debug").outputCucumberJson(true).parallel(1);
    assertTrue(result.getErrorMessages(), result.getFailCount() == 0);
}
	
}