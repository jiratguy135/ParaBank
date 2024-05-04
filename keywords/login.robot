*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/common.robot
Variables    ../testdata/profile.yaml
Variables    ../testdata/error.yaml

*** Keywords ***
Login Button
    Wait Until Element Is Visible    id=loginPanel
    Click Element    css:input[class="button"]:nth-child(1)
Input Username and Password
    [Arguments]    ${select_profile}    ${NUMBER}
    Wait Until Element Is Visible    id=loginPanel
    FOR    ${user}    IN    @{Profile}
        IF    '${user['profile']}' == '${select_profile}'
            Input Text    name:username    ${user['username']}${NUMBER}
            Input Text    name:password    ${user['password']}${NUMBER}
        END
    END
Input One Box Login
    [Arguments]    ${Username/Password}    ${userprofile}    ${NUMBER}
    Wait Until Element Is Visible    id=loginPanel
    FOR    ${user}    IN    @{Profile}
        IF    'username' == '${Username/Password}'
            IF    '${user['profile']}' == '${userprofile}'
                Input Text    name:username    ${user['username']}${NUMBER}
            END
        ELSE
            IF    '${user['profile']}' == '${userprofile}'
                Input Text    name:password    ${user['password']}${NUMBER}
            END
        END
            
        END
    
Verify Login Successfuly
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    common.Check TXT    xpath://*[@id="rightPanel"]/div/div/h1    Accounts Overview
Verify Mandatory field in Login
    [Arguments]    ${Error_code}
    Wait Until Element Is Visible    id:leftPanel
    FOR    ${error}    IN    @{Error}
        IF    '${error['index']}' == '${Error_code}'
            Check TXT    ${error['locator']}    ${error['text']}
        END
    END
Clear Login Box
    Wait Until Element Is Visible    id:leftPanel
    Clear Element Text    name:username
    Clear Element Text    name:password
Open New Account Button on Left Bar
    Wait Until Element Is Visible    xpath://*[@id="leftPanel"]/h2
    Click Element    xpath://*[@id="leftPanel"]/ul/li[1]/a
Verify Open New Account Tab
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    common.Check TXT    //*[@id="rightPanel"]/div/div/h1    Open New Account
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
Accounts Overview Button on Left Bar
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
    
Transfer Funds Button on Left Bar
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    Click Element    xpath://*[@id="leftPanel"]/ul/li[3]/a
Verify Transfer Funds Successfully
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    common.Check TXT    //*[@id="rightPanel"]/div/div/h1    Transfer Funds
Transfer Button
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1  
    Click Element    xpath://*[@id="rightPanel"]/div/div/form/div[2]/input
Input Amount Box
    [Arguments]    ${Amount}
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    Input Text    id:amount    ${Amount} 
    Select From List By Index    id:fromAccountId    0
    Select From List By Index    id:toAccountId    0
Verify Transfer Complete
    [Arguments]    ${AMOUNT}
    Sleep    5
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    common.Check TXT    xpath://*[@id="rightPanel"]/div/div/h1    Transfer Complete!
    common.Check TXT    id:amount    $${AMOUNT}.00