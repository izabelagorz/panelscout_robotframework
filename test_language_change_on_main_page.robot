*** Settings ***
Library   SeleniumLibrary
Documentation   Suite description   #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://dareit.futbolkolektyw.pl/en
${BROWSER}    Chrome
${SIGNINBUTTON}    xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}    xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${PAGELOGO}    xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${LOGOUTBUTTON}    xpath=//div/span[text()='Sign out']
${CHANGELANGUAGEBUTTON}    xpath=//div/span[text()='Polski']

*** Test Cases ***
Login to the system
    Open Login Page
    Type In Email
    Type In Password
    Click On Submit Button
    Click On Change Language Button
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

Click On Change Language Button
    Wait Until Element Is Visible    ${CHANGELANGUAGEBUTTON}
    Click Element   ${CHANGELANGUAGEBUTTON}

Assert Dashboard
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert3.png
