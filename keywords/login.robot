*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/common.robot
Variables    ../testdata/profile.yaml
Variables    ../testdata/error.yaml

*** Keywords ***
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







    


