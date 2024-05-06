*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/common.robot
*** Keywords ***
Verify Open New Account Tab
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    common.Check TXT    //*[@id="rightPanel"]/div/div/h1    Open New Account
    Sleep    5
Select Type of Account
    [Arguments]    ${Type}
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    IF    'checking' == '${Type}'
        Select From List By Index    id:type    0
    ELSE IF    'savings' == '${Type}'
        Select From List By Index    id:type    1
    END
Open New Account Button
    Wait Until Element Is Visible    xpath://*[@id="leftPanel"]/h2
    Click Element    //*[@id="rightPanel"]/div/div/form/div/input
Verify Open New Account Successfully
    Sleep    5
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    common.Check TXT    xpath://*[@id="rightPanel"]/div/div/h1    Account Opened!