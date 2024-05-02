*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/common.robot
Variables    ../testdata/register_error.yaml
Variables    ../testdata/register.yaml
Variables    ../testdata/error.yaml
*** Keywords ***
Verify Register Page display Successfully
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    Wait Until Element Contains    css:h1[class="title"]:nth-child(1)    Signing up is easy!
Register Button
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    Click Element    css:input[value="Register"]:nth-child(1)
Verify Check Mandatory
    [Arguments]    ${Expected}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${error}    IN    @{Register_Error}
        IF    '${error['index']}' == '${Expected}'
            Log    Block:${error['locator']}
        ELSE
            ${Actual}    Get Text    ${error['locator']} 
            Should Be Equal    ${Actual}    ${error['text']}
        END
            
    END
Box in Register Page
    [Arguments]    ${InputBox}    ${NUMBER}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${element}    IN    @{Register}
        IF    '${element['index']}' == '${InputBox}'
            Input Text   ${element['locator']}    ${element['text']}${NUMBER}
        END 
    END
Input All information in Register Page
    [Arguments]    ${NUMBER}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${element}    IN    @{Register}
        IF    '${element['index']}' == '11'
            Log    ${element['index']}
        ELSE
            Input Text    ${element['locator']}    ${element['text']}${NUMBER}
        END
        
    END
Clear Box in Register Page
    [Arguments]    ${InputBox}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${element}    IN    @{Register}
        IF    '${element['index']}' == '${InputBox}'
            Clear Element Text    ${element['locator']}
        ELSE
            Clear Element Text    ${element['locator']}
        END 
    END
Check Error
    [Arguments]    ${Code}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${error}    IN    @{Error}
        IF    '${error['index']}' == '${Code}'
            ${Actual}    Get Text    ${error['locator']} 
            Should Be Equal    ${Actual}    ${error['text']}
        END
    END
Verify Register Successfully
    [Arguments]    ${User}
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/h1
    Element Should Be Visible    xpath://*[@id="rightPanel"]/h1
    common.Check TXT    xpath://*[@id="rightPanel"]/h1    Welcome ${User}
