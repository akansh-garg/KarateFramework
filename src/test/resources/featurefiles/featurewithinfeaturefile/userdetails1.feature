Feature: User Detail with id 3

Scenario: scenario to show how to print,how to define variable, read file and verify its output, how to validate specific field in response

Given url 'https://reqres.in/api/users/3'
When method GET
Then status 200
And print response
# way to call other feature file from one feature file
* def feature = read('classpath:featurefiles/featurewithinfeaturefile/userdetails2.feature')
* def result = call feature
And print result
# we can fetch response and other information like headers etc from the result as shown below
And print result.response
And print 'response headers from the result are ',result.responseHeaders
