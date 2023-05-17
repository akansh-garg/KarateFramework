Feature: Conditional logic

Background: setup
   Given url appUrl

   
   Scenario: Check and increase like
    Given path 'articles'
    And params { limit : 10 , offset : 0}
    When method Get
    Then status 200
    * def favoriteCount = response.articles[0].favoritesCount
    * def firstArticle = response.articles[0]
    # here we are sending whole json object to addlike.feature and we can directly utilize its key in path param
    #* if (favoriteCount == 0 ) karate.call('AddLikes.feature',firstArticle)

    # if we want keep output of called feature  in variable then we can use ternary operator instead of if as well as shown below
    * def updateCount = favoriteCount == 0 ? karate.call('AddLikes.feature',firstArticle).updateFavouriteCount : favoriteCount

    Given path 'articles'
    And params { limit : 10 , offset : 0}
    When method Get
    Then status 200
    And match response.articles[0].favoritesCount == updateCount

