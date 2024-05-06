*** Settings ***
Library    SeleniumLibrary

Variables    ../testdata/billpay.yaml
Variables    ../testdata/billpay_error.yaml
*** Keywords ***
Click Bill Pay Tab
    Wait Until Element Is Visible    xpath://*[@id="leftPanel"]/ul/li[4]/a
    Click Element    xpath://*[@id="leftPanel"]/ul/li[4]/a
Verify Bill Pay Tab Successfully
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div[1]/h1
    Wait Until Element Contains    xpath://*[@id="rightPanel"]/div/div[1]/h1    Bill Payment Service
Click Send Payment Button
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div[1]/h1
    Click Element    xpath://*[@id="rightPanel"]/div/div[1]/form/table/tbody/tr[14]/td[2]/input
Verify Check Mandatory
    [Arguments]    ${Expected}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${error}    IN    @{BillPayError}
        IF    '${error['index']}' == '${Expected}'
            RETURN    Pass
        ELSE
            ${Actual}    Get Text    ${error['locator']} 
            Should Be Equal    ${Actual}    ${error['text']}
        END
    END
Input data to box in Bill Pay Tab
    [Arguments]    ${InputBox}
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    FOR    ${element}    IN    @{BillPay}
        IF    '${element['index']}' == '${InputBox}'
            Input Text   ${element['locator']}    ${element['text']}${InputBox}
        END 
    END
Select From Account in Bill Pay Tab
    [Arguments]    ${INDEX}
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div/h1
    ${Value}    Get Text    xpath://*[@id="rightPanel"]/div/div[1]/form/table/tbody/tr[13]/td[2]/select/option[${INDEX}]
    Select From List By Value    css:select[name="fromAccountId"]:nth-child(1)    ${Value}
    Sleep    3
Input All data to box in Bill Pay Tab
    Wait Until Element Is Visible    css:h1[class="title"]:nth-child(1)
    @{LIST}    Create List    40    41    42    43    53
    FOR    ${element}    IN    @{BillPay}
        IF    '${element['index']}' in @{LIST}
            Log    pass
        ELSE
            Input Text    ${element['locator']}    ${element['text']}
        END
    END
Verify Bill Payment Complete
    Wait Until Element Is Visible    xpath://*[@id="rightPanel"]/div/div[1]/h1
    Wait Until Element Contains    xpath://*[@id="rightPanel"]/div/div[2]/h1    Bill Payment Complete