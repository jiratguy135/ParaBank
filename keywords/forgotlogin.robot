*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/common.robot
Variables    ../testdata/findmylogin.yaml
Variables    ../testdata/findmylogin_error.yaml
Variables    ../testdata/profile.yaml
*** Variables ***

*** Keywords ***
Verify Navigate to Forgot Successfully
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/h1
    common.Check TXT    xpath://*[@id="rightPanel"]/h1    Customer Lookup
Find my login info Button
    Wait Until Element Is Visible    //*[@id="rightPanel"]/h1
    Click Element    css:input[value="Find My Login Info"]:nth-child(1)

Verify Mandatory in Findmylogin
    [Arguments]    ${Expected}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${forgot_error}    IN    @{FindmyLoginError}
        IF    '${forgot_error['index']}' == '${Expected}'
            Log    Block:${forgot_error['locator']}
        ELSE
            ${Actual}    Get Text    ${forgot_error['locator']} 
            Should Be Equal    ${Actual}    ${forgot_error['text']}
        END
            
    END
Input information to Forgot Login Page
    [Arguments]    ${InputBox}    ${NUMBER}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${forgot}    IN    @{FindmyLogin}
        IF    '${forgot['index']}' == '${InputBox}'
            Input Text   ${forgot['locator']}    ${forgot['text']}${NUMBER}
        END 
    END
Clear Box in Register Page
    [Arguments]    ${InputBox}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${forgot}    IN    @{FindmyLogin}
        IF    '${forgot['index']}' == '${InputBox}'
            Clear Element Text    ${forgot['locator']}
        ELSE
            Clear Element Text    ${forgot['locator']}
        END 
    END
Input All information in Forgot Login
    [Arguments]    ${NUMBER}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${forgot}    IN    @{FindmyLogin}
        IF    '${forgot['index']}' == '7'
            Log    ${forgot['text']}
        ELSE
            Input Text    ${forgot['locator']}    ${forgot['text']}${NUMBER}
        END
        
    END
Verify Find My Login Successfully
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/h1
    common.Check TXT    xpath://*[@id="rightPanel"]/h1    Customer Lookup
