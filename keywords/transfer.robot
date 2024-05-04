*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/common.robot

*** Keywords ***
Select From Account in Transfer Funds Tab
    [Arguments]    ${INDEX}
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    ${Value}    Get Text    xpath://*[@id="fromAccountId"]/option[${INDEX}]
    Select From List By Label    id:fromAccountId    ${Value}
    Sleep    3
Select To Account in Transfer Funds Tab
    [Arguments]    ${INDEX}
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    ${Value}    Get Text    xpath://*[@id="toAccountId"]/option[${INDEX}]
    Select From List By Label    id:toAccountId    ${Value}
    Sleep    3