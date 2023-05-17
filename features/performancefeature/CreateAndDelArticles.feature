Feature: Read request body from external file

Background:
    Given url appUrl
    * def articleRequestBody = read('file:resources/requestbody/createarticle.json')
    * def commonUtils = Java.type('com.practice.utils.CommonUtils')
    * def articleBodyContent = commonUtils.getRandomArticleContent()
    # below is the way to read dynamic data from gatlin session set by feeder. Here Title and Description are the keys of CSV feeder (csv files used for feeding data for simulation)
    * set articleRequestBody.article.title = __gatling.Title
    * set articleRequestBody.article.description = __gatling.Description
    * set articleRequestBody.article.body = articleBodyContent.body
    

    # below is the example of user think time in performance testing
    # here we can directly use thread.sleep function as scala is not entertaining thread concept also it will freeze the thread.
    * def sleep = function(ms){java.lang.Thread.sleep(ms)}
    * def pause = karate.get('__gatling.pause',sleep)

 
    Scenario: Create article and delete article
        Given path 'articles'
        And request articleRequestBody
        When method post
        Then status 200
        And match response.article.title == articleRequestBody.article.title
        * def articleID = response.article.slug

        * pause(5000)
        # Given header Authorization = 'Token ' + token
        Given path 'articles',articleID
        When method delete
        Then status 204
