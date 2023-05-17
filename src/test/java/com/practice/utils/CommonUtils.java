package com.practice.utils;

import java.util.HashMap;
import java.util.Map;

import com.github.javafaker.Faker;

public class CommonUtils {
    
    public static String generateRandomUserName(){
        Faker faker = new Faker();
        return faker.name().username();
    }

    public static String generateRandomEmail(){
        Faker faker = new Faker();
        return (faker.name().firstName() + faker.random().nextInt(1, 10000) + "@test.com");
    }

    public static Map<String,Object> getRandomArticleContent(){
        Faker faker = new Faker();
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("title", faker.gameOfThrones().character());
        map.put("description", faker.gameOfThrones().dragon());
        map.put("body", faker.gameOfThrones().city()); 
        return map;

    }
}
