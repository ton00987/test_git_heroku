Feature: User can manually edit movie

Background: Movies have been add to database.
  
  Given the following movies exist:
    |   title                   |   rating  |  release_date |
    |   Aladdin                 |   G       |   25-Nov-1992 |
    |   When Harry Met Sally    |   R       |   21-Jul-1989 |
    |   The Help                |   PG-13   |   10-Aug-2011 |
    |   Raiders of the Lost Ark |   PG      |   12-Jun-1981 |

Scenario: Edit a movie with blank title (sad path)
    Given I am on the RottenPotatoes home page
    Then I should see "Aladdin" with rating "G"
    When I follow "More about Aladdin"
    Then I on the "Aladdin" detail page
    When I press "Edit info"
    When I fill in "Title" with ""
    And I follow "Save Changes"
    Then I should be on the RottenPotatoes home page
    And I should see "Title can't be blank"


# Scenario: Edit a movie
#     Given I am on the RottenPotatoes home page
#     Then I should see "Aladdin" with rating "G"
#     When I follow "More about Aladdin"
#     Then I should be on the Edit Movie page
#     When I select "PG-13" from "Rating"
#     And I press "Save Changes"
#     Then I should be on the RottenPotatoes home page
#     And I should see ""