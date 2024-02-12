@login
@regression
Feature: WebdriverUniversity - Login Portal Page

  # Challenge - Writing tests for the login portal page
  Scenario Outline: Validate login portal page
    Given I navigate to the WebdriverUniversity homepage
    When I click on the login portal button
    And I type a username '<userName>' and a password '<password>'
    And I click on the login button
    Then I should be presented with alert box text '<expectedAlertText>'

    # Note: An apostrophe character inside the Examples table can mess up Cypress
    Examples:
      | userName  | password     | expectedAlertText    |
      | webdriver | webdriver123 | validation succeeded |
      | webdriver | webdriver1   | validation failed    |
      | joe       | pass12345    | validation failed    |
