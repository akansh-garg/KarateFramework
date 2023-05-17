package com.practice.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import com.intuit.karate.Runner;

public class CreateTokens {
    private static final ArrayList<String> tokens = new ArrayList<>();
    private static final AtomicInteger counter = new AtomicInteger();

    private static String[] emails = {
        "karatedemo101@test.com",
        "karatedemo102@test.com",
        "karatedemo103@test.com"
    };

    public static String getNextToken(){
        return tokens.get(counter.getAndIncrement() % tokens.size());
    }


    public static void createAccessTokens(){

        for(String email: emails){
            Map<String, Object> account = new HashMap<>();
            account.put("userEmail", email);
            account.put("userPassword", "karate123");
            Map<String, Object> result = Runner.runFeature("file:features/commonfeatures/TokenGeneration.feature@GenerateToken", account, true);
            System.out.println("my result "+ result);
            tokens.add(result.get("authToken").toString());
        }

    }
    
}
