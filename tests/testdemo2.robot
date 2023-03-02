*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser
#resource - commenting

*** Variables ***
${Error_message_login}  css:.alert-danger       #variables are used to avoid dependancy in locators instead of using common
#deendancy we are using global variable to avoid conflict

*** Test Cases ***
Validate UnSuccessful Login
    open the browser with the mortagage payment URL
    Fill the login form
    wait until it checks and display display error message
    verify error message is correct

*** Keywords ***
open the browser with the mortagage payment URL
    Create Webdriver    Chrome  executable_path=C:\\Sandeep_Python\\chromedriver_win32\\chromedriver.exe
    Go To   https://rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window


Fill the login form
    Input Text  xpath://input[@id='username']   sandeepbirari
    Input Password  xpath://input[@id='password']   Sandy@123
    Click Button    xpath://input[@type='submit']


wait until it checks and display display error message
    Wait Until Element Is Visible    ${Error_message_login}


verify error message is correct
#    ${result}=  Get Text    ${Error_message_login}       #local varivable
#    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_message_login}  Incorrect username/password.
    Sleep    10


