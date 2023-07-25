*** Settings ***
Library   SeleniumLibrary
Documentation   Suite description   #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}    Chrome
${SIGNINBUTTON}    xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}    xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${PAGELOGO}    xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${LOGOUTBUTTON}    xpath=//div/span[text()='Sign out']
${SCOUTSPANELLOGINPAGE}    xpath=//*[@id="__next"]/form/div/div[1]/h5

*** Test Cases ***
Login to the system
    Open Login Page
    Type In Email
    Type In Password
    Click On Submit Button
    Click On Logout Button
    Assert Dashboard
    [Teardown]    Close Browser

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type In Email
    Input Text    ${EMAILINPUT}    user07@getnada.com
Type In Password
    Input Text    ${PASSWORDINPUT}    Test-1234
Click On Submit Button
    Click Element   ${SIGNINBUTTON}

Click On Logout Button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${LOGOUTBUTTON}

Assert Dashboard
    Wait Until Element Is Visible     ${SCOUTSPANELLOGINPAGE}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot    alert1.png
