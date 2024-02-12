Feature: WebdriverUniversity - Contact Us Page

  Background: Pre-conditions
    Given I navigate to the WebdriverUniversity homepage
    When I click on the contact us button

  # Positive test scenario
  Scenario: Valid Contact Us Form Submission
    And I type a first name
    And I type a last name
    And I enter an email address
    And I type a comment
    And I click on the submit button
    Then I should be presented with a successful contact us submission message

  # Negative test scenario
  Scenario: Invalid Contact Us Form Submission
    And I type a first name
    And I type a last name
    And I type a comment
    And I click on the submit button
    Then I should be presented with a unsuccessful contact us submission message

  # Cucumber Expressions inside the scenario
  Scenario: Valid Contact Us Form Submission - Using specific data
    Given I navigate to the WebdriverUniversity homepage
    When I click on the contact us button
    And I type a specific first name "Mike"
    And I type a specific last name "Woods"
    And I type a specific email address "mike_woods101@mail.com"
    And I type a specific word "hello there" and a number 69 within the comment input field
    And I click on the submit button
    Then I should be presented with a successful contact us submission message

  # DRY Principle - Avoiding duplications using dynamic Scenario Outlines
  Scenario Outline: Validate contact us page
    Given I navigate to the WebdriverUniversity homepage
    When I click on the contact us button
    And I type a first name <firstName> and a last name '<lastName>'
    And I type a specific email address '<emailAddress>' and a comment '<comment>'
    And I click on the submit button
    Then I should be presented with header text '<message>'

    # Note: An apostrophe character inside the Examples table can mess up Cypress
    Examples:
      | firstName | lastName      | emailAddress       | comment               | message                      |
      | John      | Snow          | john_snow@mail.com | Howdy?                | Thank You for your Message!  |
      | Kylo      | Ren           | kylo-ren@mail.com  | I are not a Skywalker | Thank You for your Message!  |
      | Dutch     | van der Linde | grace_hudson       | Whoops                | Error: Invalid email address |
