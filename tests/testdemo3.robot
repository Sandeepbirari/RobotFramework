#in this test case I have called the resource file for our project
*** Settings ***
Documentation    To validate the login form
Library          SeleniumLibrary
Test Setup      open the browser with the mortagage payment URL
Test Teardown   Close browser session
Resource        resource.robot

*** Variables ***
${Error_message_login}  css:.alert-danger       #variables are used to avoid dependancy in locators instead of using common
#deendancy we are using global variable to avoid conflict

*** Test Cases ***
Validate UnSuccessful Login

    Fill the login form
    wait until it checks and display display error message
    verify error message is correct

*** Keywords ***

Fill the login form
    Input Text  xpath://input[@id='username']       ${user_name}
    Input Password  xpath://input[@id='password']   ${invalid_pass}
    Click Button    xpath://input[@type='submit']


wait until it checks and display display error message
    Wait Until Element Is Visible    ${Error_message_login}


verify error message is correct
#    ${result}=  Get Text    ${Error_message_login}       #local varivable
#    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_message_login}  Incorrect username/password.
    Sleep    10


