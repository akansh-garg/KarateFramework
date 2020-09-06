Feature: Post request example

Scenario: Creation of new user

Given url 'https://reqres.in/api/users'
And request '{"name": "morpheus","job": "leader"}'
And headers {Content-Type : 'application/json', Accept : 'application/json'}
# in case of single header we need to pass like this And header Content-Type = application/json
# to pass query params in request we can pass like this... And param delay = 3 and in case of multiple parameter follow same rule as we followed for headers
When method POST
Then status 201
And print 'response---',response
