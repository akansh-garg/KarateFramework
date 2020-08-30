Feature: User Detail with id 3

Scenario: get user detail for user id 3

Given url 'https://reqres.in/api/users/3'
When method GET
Then status 200
And print response

Scenario: get user detail for user id 4

Given url 'https://reqres.in/api/users/4'
When method GET
Then status 200
And print response