
Feature: HomePage features

# we can use background to initialize common variable everytime for each scenario
Background:
    Given url appUrl

Scenario: Get Tag Information
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains 'welcome'
    # we can also match multiple of array in single statement as well like this match response.tags contains ['welcome', 'ipsum']
    And match response.tags !contains 'TRUCK'
    And match response.tags == '#array'
    # here contains any means if any of the value is present in given field then this test will pass
    # here contains only means only given value should be present in field of response
    And match response.tags contains any ['ansh','welcome']
    #And match response.tags !contains any ['welcome', 'ipsum']
    # we can use each to verify type of each element as shown below
    And match each response.tags == '#string'

Scenario: Get article information
    * def timeValidator = read('file:resources/js/timevalidator.js')

    #Given url 'https://conduit.productionready.io/api/articles?limit=10&offset=0'
    Given path 'articles'
    # instead of defining param separately as shown below we can define in single json object using params keyword
    #And param limit = 10
    #And param offset = 0
    And params { limit : 10 , offset : 0}
    When method Get
    Then status 200
    And match response.articlesCount == 197
    # way to check the length of json array in feature file mentioned below
    And match response.articles == '#[10]'
    And match response.articlesCount !=500
    And match response == {"articles" : '#array', "articlesCount" : 197 }
    And match response.articles[0].createdAt contains '2022'
    # using below syntax we are verifying that whether favoritesCount in any of the jsonobject of articles json array has value 
    And match response.articles[*].favoritesCount contains 150
    #And match response.articles[*].author.bio contains null
    #instead of using hardcode static path we can use double .. operator with destination node as shown below
    And match response..bio contains null
    # below is the example where we are checking that following node of each json object inside articles array is having false value
    And match response..following contains false
    # below are the few examples of fuzzy matching
    And match each response..following == '#boolean'
    And match each response..favoritesCount == '#number'
    # double # means that bio node value either null or string type Also if this node is not present then in that case also this step will pass
    And match each response..bio == '##string'
    # here bio1 node is not present but this test will work fine
    And match each response..bio1 == '##string'
    # below example of schema validation
    And match each response.articles contains
    """
        {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": "#array",
            "createdAt": "#? timeValidator(_)",
            "updatedAt": "#? timeValidator(_)",
            "favorited": "#boolean",
            "favoritesCount": "#number",
            "author": {
                "username": "#string",
                "bio": '##string',
                "image": "#string",
                "following": "#boolean"
            }
        }
    """