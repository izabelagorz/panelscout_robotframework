*** Settings ***
Library   SeleniumLibrary
Documentation   Suite description   #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://dareit.futbolkolektyw.pl/en
${BROWSER}    Chrome
${SIGNINBUTTON}    xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}    xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
#${PAGELOGO}    xpath=//div/a[text()='Remind password']
${REMINDPASSWORD}    xpath=//div/a[text()='Remind password']
${REMINDEMAILINPUT}    xpath=//input

*** Test Cases ***
Login to the system
    Open Login Page
    Type In Email
    Type In Password
    Click On Submit Button
    Click On Remind Button
    Type In Email Remaind Password
    Assert Dashboard
    [Teardown]    Close Browser

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type In Email
    Input Text    ${EMAILINPUT}    user07@getnada.com
Type In Password
    Input Text    ${PASSWORDINPUT}    Test1234
Click On Submit Button
    Click Element   ${SIGNINBUTTON}
Click On Remind Button
    Wait Until Element Is Visible    ${REMINDPASSWORD}
    Click Element    ${REMINDPASSWORD}
Type In Email Remaind Password
    Input Text    ${REMINDEMAILINPUT}    izabelagorz@gmail.com
Assert Dashboard
    Title Should Be    Remind password
    Capture Page Screenshot    alert2.png