package com.karate.runner;

import org.junit.runner.RunWith;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

@RunWith(Karate.class)
//@KarateOptions(features = {"classpath:featurefiles/basicinfo/userDetails.feature"})
@KarateOptions(features = {"classpath:featurefiles/postrequestexample/postrequestdetails.feature"})
public class TestRunner {

}
