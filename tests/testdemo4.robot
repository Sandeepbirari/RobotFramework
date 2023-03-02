#In this test case we are going to pass multiple sets of login details through arguments in keywords.*** Keywords ***

*** Settings ***
Documentation    To validate the login form
Library          SeleniumLibrary
Test Setup      open the browser with the mortagage payment URL
#Test Teardown   Close browser session
Resource        resource.robot

*** Variables ***
${Error_message_login}  css:.alert-danger       #variables are used to avoid dependancy in locators instead of using common
#deendancy we are using global variable to avoid conflict
${checkout}     xpath://a[@class='nav-link btn btn-primary']

*** Test Cases ***
#Validate UnSuccessful Login
#
#    Fill the login form     ${user_name}    ${invalid_pass}
#    wait until element is located on page   ${Error_message_login}
#    verify error message is correct

Validate cards display in the shopping page
    Fill the login form     ${user_name}    ${valid_pass}
    wait until element is located on page   ${checkout}
    Sleep    5
    Verify the card title in shopping page
    Select the Card     Blackberry

Fill the login form details
    Fill the login form details and select dropdown


*** Keywords ***

Fill the login form
    [Arguments]    ${username}      ${password}
    Input Text  xpath://input[@id='username']       ${username}
    Input Password  xpath://input[@id='password']   ${password}
    Click Button    xpath://input[@type='submit']


wait until element is located on page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}


verify error message is correct
#    ${result}=  Get Text    ${Error_message_login}       #local varivable
#    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_message_login}  Incorrect username/password.
    Sleep    10

Verify the card title in shopping page
    @{expectedlist} =   Create List      iphone X    Samsung Note 8     Nokia Edge   Blackberry
    ${elements} =   Get WebElements     css:.card-title
    @{actuallist} =       Create List
    FOR     ${element}  IN    @{elements}
        Log     ${element.text}
        Append To List  ${actuallist}   ${element.text}
    END
    Lists Should Be Equal   ${expectedlist}     ${actuallist}


Select the Card
    [Arguments]     ${cardname}
    ${elements} =   Get WebElements     css:.card-title
    ${index}    Set Variable    1
    FOR     ${element}  IN    @{elements}
        Exit For Loop If    '${cardname}' == '${element.text}'
        ${index} =  Evaluate  ${index} + 1
    END
    Click Button    xpath:(//div[@class="card-footer"])[${index}]/button
    Sleep    5

Fill the login form details and select dropdown
    Input Text  xpath://input[@id='username']       sandeepbirari513@gmail.com
    Input Password  xpath://input[@id='password']   Sandeep@123
    Click Element    xpath://*[@value='user']
    Wait Until Element Is Visible    xpath://div[@class='modal-body']
    Click Button    //button[@id='okayBtn']
    Select From List By Value    xpath://select[@class='form-control']      teach
    #Click Button    id:terms
    Select Checkbox    terms
    Sleep    5
