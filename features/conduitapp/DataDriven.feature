Feature: Datadriven Scenario

Background: setup
    Given url appUrl
    * def commonUtils = Java.type('com.practice.utils.CommonUtils')

    
Scenario Outline: data driven scenario
        * def randomEmail = commonUtils.generateRandomEmail()
        * def randomUsername = commonUtils.generateRandomUserName()

        Given path 'users'
        And request {"user":{"email" : "<email>", "password":"<password>","username":"<username>"}}
        When method post
        Then status 422
        And match response == <errorResponse>
    Examples:
    |email               |password |username      |errorResponse|
    |sampleeeeee@test.com|karate123|dlajdlajdlajda|{"errors":{"email":["has already been taken"],"username":["has already been taken"]}}|
    |#(randomEmail)|karate123|dlajdlajdlajda|{"errors":{"username":["has already been taken"]}}|
    |sampleeeeee@test.com|karate123|#(randomUsername)|{"errors":{"email":["has already been taken"]}}|