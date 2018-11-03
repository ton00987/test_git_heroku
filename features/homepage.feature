Feature: User can see movies in homepage
  
  As moviegoer who first come to this website
  I should see many movies in homepage

Background: Movies have been add to database.
  
  Given the following movies exist:
    |   title                   |   rating  |  release_date |
    |   Aladdin                 |   G       |   25-Nov-1992 |
    |   When Harry Met Sally    |   R       |   21-Jul-1989 |
    |   The Help                |   PG-13   |   10-Aug-2011 |
    |   Raiders of the Lost Ark |   PG      |   12-Jun-1981 |
    
Scenario:  I should see all movies in homepage
  
  Given I am on the RottenPotatoes home page
  Then I should see all of the movies
  And I should see following movies:
    |   title                   |   rating  |  release_date |
    |   Aladdin                 |   G       |   25-Nov-1992 |
    |   When Harry Met Sally    |   R       |   21-Jul-1989 |
    |   The Help                |   PG-13   |   10-Aug-2011 |
    |   Raiders of the Lost Ark |   PG      |   12-Jun-1981 |