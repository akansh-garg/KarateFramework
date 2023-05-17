Feature: Read request body from external file

Background:
    Given url appUrl
    * def articleRequestBody = read('file:resources/requestbody/createarticle.json')
    * print articleRequestBody
    * def commonUtils = Java.type('com.practice.utils.CommonUtils')
    * def articleBodyContent = commonUtils.getRandomArticleContent()
    * print articleBodyContent
    * set articleRequestBody.article.title = articleBodyContent.title
    * set articleRequestBody.article.body = articleBodyContent.body
    * set articleRequestBody.article.description = articleBodyContent.description

 
    Scenario: Create article with dynamic data.
        Given path 'articles'
        And request articleRequestBody
        When method post
        Then status 200
        And match response.article.title == articleRequestBody.article.title
        * def articleID = response.article.slug

        # Given header Authorization = 'Token ' + token
        Given path 'articles',articleID
        When method delete
        Then status 204
