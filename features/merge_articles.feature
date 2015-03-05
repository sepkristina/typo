Feature: Merge Articles
  As a blog administrater
  In order to join information of two blogs
  I want to be able to merge two articles into one article on my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    Given article 4 with title 'myarticle' and author 'me' and body 'bonjour' exists
    And article 98 does not exists
    And article 2 with title 'hisarticle' and author 'him' and body 'aurevoir' exists
    And article 4 has a comment with content 'a'
    And article 2 has a comment with content 'q'

  Scenario: Successfully merge articles
    Given I am admin
    And I am on the edit page for the article 4
    And I fill the merging article spot with 2
    And I press merge button
    Then I should be on the All Article page
    And I should see article 4
    And I should not see article 2
    When I click on article 4
    Then I should see comment 'q'
    And I should see comment 'a'
    And I should see author 'me'
    And I should not see author 'him'
    And I should see title 'my article'
    And I should not see title 'his article'

  Scenario: Merge article (sad path: wrong id)
    Given I am an admin
    And I am on the edit page for the article 4
    And I fill the merging article spot with 98
    And I press merge
    Then I should see "Wrong id for the article"
    And I should be on the edit page for article 4
