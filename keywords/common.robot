*** Settings ***
Library    SeleniumLibrary

Variables    ../testdata/error.yaml
*** Variables ***
${URL}    https://parabank.parasoft.com/parabank/index.htm

*** Keywords ***
Open Browser ParaBank
    Open Browser    ${URL}    chrome
    Maximize Browser Window
Register Button
    Wait Until Element Is Visible    id:leftPanel
    Click Element    xpath://*[@id="loginPanel"]/p[2]/a
Login Button
    Wait Until Element Is Visible    id=loginPanel
    Click Element    css:input[class="button"]:nth-child(1)
Open New Account Button
    Wait Until Element Is Visible    xpath://*[@id="leftPanel"]/h2
    Click Element    xpath://*[@id="leftPanel"]/ul/li[1]/a
Transfer Funds Button
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    Click Element    xpath://*[@id="leftPanel"]/ul/li[3]/a
Check TXT
    [Arguments]    ${Locator}    ${Expected}
    Wait Until Element Is Visible    ${Locator}
    ${Actual}    Get Text    ${Locator}
    Should Be Equal    ${Actual}    ${Expected}
Forgot login info? Button
    Wait Until Element Is Visible    id:leftPanel
    Click Element    xpath://*[@id="loginPanel"]/p[1]/a
Check Error
    [Arguments]    ${Code}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    Sleep    10
    FOR    ${error}    IN    @{Error}
        IF    '${error['index']}' == '${Code}'
            ${Actual}    Get Text    ${error['locator']} 
            Should Be Equal    ${Actual}    ${error['text']}
            Sleep    5
        END
    END
Logout Button
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    Click Element    xpath://*[@id="leftPanel"]/ul/li[8]/a