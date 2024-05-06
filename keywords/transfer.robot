*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/common.robot

*** Keywords ***
Transfer Button
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1  
    Click Element    xpath://*[@id="rightPanel"]/div/div/form/div[2]/input
Input Amount Box
    [Arguments]    ${Amount}
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    Input Text    id:amount    ${Amount} 
    Select From List By Index    id:fromAccountId    0
    Select From List By Index    id:toAccountId    0
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
Verify Transfer Funds Successfully
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    common.Check TXT    //*[@id="rightPanel"]/div/div/h1    Transfer Funds
Verify Transfer Complete
    [Arguments]    ${AMOUNT}
    Sleep    5
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    common.Check TXT    xpath://*[@id="rightPanel"]/div/div/h1    Transfer Complete!
    common.Check TXT    id:amount    $${AMOUNT}.00


