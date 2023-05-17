
Feature: Signup feature

Background:
Given url appUrl
* def commonUtils = Java.type('com.practice.utils.CommonUtils')

    Scenario: Signup Scenario using random generation
        * def randomEmail = commonUtils.generateRandomEmail()
        * def randomUsername = commonUtils.generateRandomUserName()

        Given path 'users'
        And request {"user":{"email" : '#(randomEmail)',"password":"karate123","username":'#(randomUsername)'}}
        When method post
        Then status 200
        And match response contains
        """
        {
            "user": {
                "email": '#(randomEmail)',
                "username": '#(randomUsername)',
                "bio": null,
                "image": '#string',
                "token": '#string'
            }
        }
        """