Feature: Articles


Background:
    # we can directly use the global variable defined in karate-config.js
    Given url appUrl
    # using call once we will call generate token feature only once it will not be executed again and again for each scenario.
    # if we use call read then it will call the called scenario each time for each scenario
    #* def tokenResponse = callonce read('../commonfeatures/TokenGeneration.feature@GenerateToken')
    # we can feature with arguments like this
    #* def tokenResponse = callonce read('../commonfeatures/TokenGeneration.feature@GenerateToken'){"emailargument" : "sample1@test.com" , "passwordargument" : "karate123"}
    #* def token = tokenResponse.authToken
    
    @ignore
    Scenario: Create new articles
        # path value will vanish after we hit the request that's why we are able to use path again for another request in same scenario
        Given path 'articles'
        And request {"article":{"tagList":[],"title":"samplearticle13","description":"samplearticle","body":"my first article"}}
        # instead adding authorization header in each scenario we can define global headers in karate-config.js
        # And header Authorization = 'Token ' + token
        When method post
        Then status 200
        And match response.article.title == 'samplearticle13'

        
        Scenario: create and delete articles
            # path value will vanish after we hit the request that's why we are able to use path again for another request in same scenario
            Given path 'articles'
            #And request {"article":{"tagList":[],"title":"samplearticle13","description":"samplearticle","body":"my first article"}}
            # instead of adding request body in single line we can use multi expression as well using 3 " as shown below
            And request 
            """
            {
            "article": {
                "tagList": [
                
                ],
                "title": "samplearticle13",
                "description": "samplearticle",
                "body": "my first article"
            }
            }
            """ 

            # instead adding authorization header in each scenario we can define global headers in karate-config.js
            # And header Authorization = 'Token ' + token
            When method post
            Then status 200
            * def articleID = response.article.slug

            # Given header Authorization = 'Token ' + token
            Given path 'articles',articleID
            When method delete
            Then status 204
