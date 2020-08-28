Feature: User Details

Scenario: scenario to show how to print,how to define variable, read file and verify its output, how to validate specific field in response

Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
And print response
# we can use Given as well instead of * to declare value. If we want to use same file in multiple steps we can read this file under scenario keyword
* def expectedOutput = read('classpath:jsonfiles/singleuser.json')
And match response == expectedOutput
And match response.data.id == 2