
Feature: hooks example

# we already implemented before hooks using background and karate-config.js in other feature files. In this feature file we are checking only after hooks
Background:
* configure afterScenario  = function() {karate.log('inside after scenario hook')}

* configure afterFeature = function() {karate.log('inside after feature hook')}

    Scenario: Scenario 1
        * print 'scenario1'

    Scenario: Scenario 1
        * print 'scenario2'
        