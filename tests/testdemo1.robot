*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
#resource - commenting

*** Test Cases ***
Validate UnSuccessful Login
    open the browser with the mortagage payment URL
    Fill the login form
    wait until it checks and display display error message
    verify error message is correct

*** Keywords ***
open the browser with the mortagage payment URL
    Create Webdriver    Chrome      executable_path=C:\\Sandeep_Python\\chromedriver_win32\\chromedriver.exe
    Go To   https://rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window


Fill the login form
    Input Text  xpath://input[@id='username']   sandeepbirari
    Input Password  xpath://input[@id='password']   Sandy@123
    Click Button    xpath://input[@type='submit']


wait until it checks and display display error message
    Wait Until Element Is Visible    css:.alert-danger


verify error message is correct
    ${result}=  Get Text    css:.alert-danger
    Should Be Equal As Strings  ${result}   Incorrect username/password.

