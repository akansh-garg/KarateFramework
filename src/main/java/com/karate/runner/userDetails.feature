Feature: User Details

Scenario: Get call for single user validation

Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200

