Feature: add likes

Background:
    Given url appUrl

    Scenario: add likes
        Given path 'articles',slug,'favorite'
        And request {}
        When method post
        Then status 200
        * def updateFavouriteCount = response.article.favoritesCount