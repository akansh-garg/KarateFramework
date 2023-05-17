Feature: Retry And Sleep

Background: setup
    Given url appUrl
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }

    Scenario: retry logic
    * configure retry = {count : 10 , interval : 5000}
    Given path 'articles'
    And params { limit : 10 , offset : 0}
    # always use retry until before executing when condition or basically hitting api
    And retry until response.articles[0].favoritesCount == 1
    When method Get
    Then status 200


    Scenario: sleep example
        Given path 'articles'
        And params { limit : 10 , offset : 0}
        When method Get
        * eval sleep(5000)
        Then status 200

 