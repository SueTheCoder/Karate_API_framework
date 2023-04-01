@smoke
Feature: Parameters Example

  Background:
    * def petUrl = 'https://petstore.swagger.io/v2/store'
    * def spartanUrl = 'http://52.207.61.129:8000'

  Scenario: path parameter example
    Given url petUrl
    And path 'inventory'
    When method get
    Then status 200

  Scenario: get all spartan with path
    Given url spartanUrl
    And path "api/spartans"
    When method get
    Then status 200
    And print response

  Scenario: get one spartan
    Given url spartanUrl
    And path "api/spartans"
    And path '9'
    When method get
    Then status 200
    And print response
    And match response == {"gender": "Female","phone": 1702025787,"name": "Florrie", "id": 9 }

  Scenario: query parameters
    Given url spartanUrl
    And path 'api/spartans/search'
    And param nameContains = 'j'
    And param gender = 'Female'
    And method get
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
       # verify each spartan is female
    Then match each response.content contains { "gender": "Female"}
       #same verification
    Then match each response.content[*].gender == 'Female'
       # verify first one is Jaimie
    Then match response.content[0].name == "Jeanelle"
       # verify each phone number  is  actually a number
    Then match each response.content[*].phone == '#number'
