package com.karate.runner;

import org.junit.runner.RunWith;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

@RunWith(Karate.class)
@KarateOptions(features = {"classpath:featurefiles/userDetails.feature"})
public class TestRunner {

}