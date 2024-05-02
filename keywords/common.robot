*** Settings ***
Library    SeleniumLibrary

Variables    ../testdata/error.yaml
*** Variables ***
${URL}    https://parabank.parasoft.com/parabank/index.htm
${JSPath}    document.querySelector('amount.errors').shadowRoot
*** Keywords ***
Open Browser ParaBank
    Open Browser    ${URL}    chrome
    Maximize Browser Window
Register Page
    Wait Until Element Is Visible    id:leftPanel
    Click Element    xpath://*[@id="loginPanel"]/p[2]/a
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
    FOR    ${error}    IN    @{Error}
        IF    '${error['index']}' == '${Code}'
            ${Actual}    Get Text    ${error['locator']} 
            Should Be Equal    ${Actual}    ${error['text']}
        ELSE IF    '34' == '${Code}'
            Element Text Should Be    dom:${JSPath}    ${error['text']}
        END
    END
Logout Button
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    Click Element    xpath://*[@id="leftPanel"]/ul/li[8]/a