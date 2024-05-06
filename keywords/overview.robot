*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/common.robot
*** Keywords ***
Accounts Overview Button
    Wait Until Element Is Visible    xpath://*[@id="leftPanel"]/h2
    Click Element    xpath://*[@id="leftPanel"]/ul/li[2]/a
Verify Accounts Overview Successfully
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    common.Check TXT    xpath://*[@id="rightPanel"]/div/div/h1    Accounts Overview
Select Account and Verify Accounts Detail Tab
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    Wait Until Element Is Visible    xpath://*[@id="accountTable"]/tbody/tr[1]/td[1]/a
    ${Account}    Get Text    xpath://*[@id="accountTable"]/tbody/tr[1]/td[1]
    ${Balance}    Get Text    xpath://*[@id="accountTable"]/tbody/tr[1]/td[2]
    ${Available_Amount}    Get Text    xpath://*[@id="accountTable"]/tbody/tr[1]/td[3]
    Click Element    css:a[href="activity.htm?id=${Account}"]:nth-child(1)
    Sleep    5
    Wait Until Element Is Visible    id:accountId
    ${Account_detail}    Get Text    id:accountId
    ${Balance_detail}    Get Text    id:balance
    ${Available_Amount_detail}    Get Text    id:availableBalance
    common.Check TXT    xpath://*[@id="rightPanel"]/div/div[1]/h1    Account Details
    Should Be Equal    ${Account}    ${Account_detail}
    Should Be Equal    ${Balance}    ${Balance_detail}
    Should Be Equal    ${Available_Amount}    ${Available_Amount_detail}