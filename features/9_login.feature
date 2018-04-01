Feature: Login

    Users should be able to log in.

    Scenario: logging in
        Given a user is not logged in
        When they visit the homepage
        Then there should be a link to log in

    Scenario: logging out
        Given a user is logged in
        When they visit the homepage
        Then there should be a link to log out

    Scenario: 
        Given a user is not logged in
        And they visit the homepage
        When they visit the login link
        Then they should be logged in

    Scenario:
        Given a user is logged in
        And they visit the homepage
        When they visit the logout link
        Then they should be logged out