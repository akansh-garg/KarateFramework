Feature: Generate token

Background:
    Given url appUrl
    * print 'inside token generation feature'

@GenerateToken
Scenario: tokenGeneration
    Given path 'users/login'
    # here we are directly using the credentials from karate-config.js and both statement are fine without "" and with ""
    #And request {"user": {"email": #(userEmail) ,"password": #(userPassword)}}
    And request {"user": {"email": "#(userEmail)" ,"password": "#(userPassword)"}}
    # if call this feature from other feature with argument we need to define request or variable in this manner
    # And request {"user": {"email": "#(emailargument)","password": "#(passwordargument)"}}
    And print 'generating token using ' + userEmail
    When method post
    Then status 200
    * def authToken = response.user.token