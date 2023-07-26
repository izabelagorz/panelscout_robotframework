*** Settings ***
Library   SeleniumLibrary
Documentation   Suite description   #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}    Chrome
${SIGNINBUTTON}    xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}    xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${ADDPLAYERBUTTON}    xpath=//*[text()='Add player']
${EMAILINPUT2}    xpath=//div/input[@name='email']
${NAME}    xpath=//div/input[@name='name']
${SURNAME}    xpath=//div/input[@name='surname']
${PHONE}    xpath=//div/input[@name='phone']
${WEIGHT}    xpath=//div/input[@name='weight']
${HEIGHT}    xpath=//div/input[@name='height']
${AGE}    xpath=//div/input[@name='age']
${CLUB}    xpath=//div/input[@name='club']
${LEVEL}    xpath=//div/input[@name='level']
${MAINPOSITION}    xpath=//div/input[@name='mainPosition']
${SECONDPOSITION}    xpath=//div/input[@name='secondPosition']
${SELECDLEG}    xpath=//*[@id='mui-component-select-leg']
${RIGHTLEG}    xpath=//li[1]
${SELECDISTRICT}    xpath=//*[@id='mui-component-select-district']
${LESSERPOLAND}    xpath=//*[@data-value='malopolskie']
${LACZYNASPILKA}    xpath=//*[@name='webLaczy']
${MINUT}    xpath=//div/input[@name='web90']
${BUTTONADDPLAYER}    xpath=//*[@type='submit']

*** Test Cases ***
Login to the system
    Open Login Page
    Type In Email
    Type In Password
    Click On Submit Button
    Click on Add Player Button
    Type In Email Input
    Type In Name
    Type In Surname
    Type In Phone
    Type In Weight
    Type In Height
    Type In Age
    Type In Club
    Type In Level
    Type In Main Position
    Type In Second Position
    Select Leg
    Select District
    Type In Leczy Nas Pilka
    Type In Minut
    Click In Submit Button Add Player
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
Click on Add Player Button
    Wait Until Element Is Visible    ${ADDPLAYERBUTTON}
    Click Element    ${ADDPLAYERBUTTON}
Type In Email Input
    Wait Until Element Is Visible    ${EMAILINPUT2}
    Input Text    ${EMAILINPUT2}    user123@gmail.com
Type In Name
    Input Text    ${NAME}    Maria
Type In Surname
    Input Text    ${SURNAME}    Wieczorek
Type In Phone
    Input Text    ${PHONE}    +48666254888
Type In Weight
    Input Text    ${WEIGHT}    50
Type In Height
    Input Text    ${HEIGHT}    164
Type In Age
    Input Text    ${AGE}    12122023
Type In Club
    Input Text    ${CLUB}    Swój
Type In Level
    Input Text    ${LEVEL}    99
Type In Main Position
    Input Text    ${MAINPOSITION}    Zawsze
Type In Second Position
    Input Text    ${SECONDPOSITION}    Nigdy
Select Leg
    Click Element    ${SELECDLEG}
    Wait Until Element Is Visible    ${RIGHTLEG}
    Click Element    ${RIGHTLEG}
Select District
    Click Element    ${SELECDISTRICT}
    Wait Until Element Is Visible    ${LESSERPOLAND}
    Click Element    ${LESSERPOLAND}
Type In Leczy Nas Pilka
    Wait Until Element Is Visible    ${LACZYNASPILKA}
    Input Text    ${LACZYNASPILKA}    laczynaspilka.pl/strona-glowna
Type In Minut
    Wait Until Element Is Visible    ${MINUT}
    Input Text    ${MINUT}    laczynaspilka.pl/strona-glowna
Click In Submit Button Add Player
    Click Element    ${BUTTONADDPLAYER}
Assert Edit Page
     Wait Until Location Is Not    https://scouts-test.futbolkolektyw.pl/en/players/add
     Title Should Be    Edit player Maria Wieczorek
     Capture Page Screenshot    alert5.png
