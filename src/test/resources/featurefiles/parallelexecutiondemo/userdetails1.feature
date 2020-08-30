Feature: User Detail with id 2

Scenario: scenario to show how to print,how to define variable, read file and verify its output, how to validate specific field in response

Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
And print response