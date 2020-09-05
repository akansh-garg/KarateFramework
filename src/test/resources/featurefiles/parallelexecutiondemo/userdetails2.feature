Feature: User Detail with id 3


Scenario: get user detail for user id 3

Background:
 * url 'https://reqres.in/api/users'

Given path 3
When method GET
Then status 200
And print response

#to make sure that specific scenario is not executed in parallel with other scenario of particular feature file
@parallel=false
Scenario: get user detail for user id 4

# instead of writing the complete url everytime we can pass common url in background and can use path keyword in scenario
Given path 4
When method GET
Then status 200
And print response