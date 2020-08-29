Feature: User Detail with id 2

Scenario: scenario to show how to print,how to define variable, read file and verify its output, how to validate specific field in response

# background is used to use variable accross multiple scenarios.
Background:
	* def multipleData = read('classpath:jsonfiles/multipleuserdatainsinglejson.json')

Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
And print response
# we can use Given as well instead of * to declare value. If we want to use same file in multiple steps we can read this file under scenario keyword
* def expectedOutput = read('classpath:jsonfiles/singleuser.json')
And match response == expectedOutput
# this is the way to read specific output from multiple data of single json file
And match response == multipleData[0]
And match response.data.id == 2
# in this step, We are validating whole response except one field called lastname because it is mentioned #ignore in json file
* def expectedOutputIgnore = read('classpath:jsonfiles/singleuserwithignorevalue.json')
And match response == expectedOutputIgnore
And print expectedOutputIgnore
# below step shows how to check specific field is present in response inrespective of their value 
And match response.data.first_name != null
# below step shows how to check specific field is present in response inrespective of their value
# note:  if we directly compare with null without storing it in variable then test scenario will fail
* def first_name1 = response.data.first_name1
And match first_name1 == null
And print multipleData[1]