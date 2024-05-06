*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/common.robot
Resource    ../keywords/registerpage.robot
Resource    ../keywords/login.robot
Resource    ../keywords/forgotlogin.robot
Resource    ../keywords/newaccount.robot
Resource    ../keywords/overview.robot
Resource    ../keywords/transfer.robot
Resource    ../keywords/billpay.robot

Suite Setup    common.Open Browser ParaBank
Suite Teardown   Close All Browsers
*** Variables ***

${NUMBER}    ParaBank101
${USERNAME}    username${NUMBER}
${USER}    pro_file
${AMOUNT}    1000
${EMPTY}
*** Test Cases ***
TC_001 Verify system navigate to register page
    common.Register Button
    registerpage.Verify Register Page display Successfully
TC_002 Verify All mandatory field in Register page
    registerpage.Register Button
    registerpage.Verify Check Mandatory    ${EMPTY}
TC_003 Verify input firstname not display warning in Register page
    registerpage.Box in Register Page    0    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    0
    registerpage.Clear Box in Register Page    0
TC_004 Verify input lasttname not display warning in Register page
    registerpage.Box in Register Page    1    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    1
    registerpage.Clear Box in Register Page    1
TC_005 Verify input address street not display warning in Register page
    registerpage.Box in Register Page    2    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    2
    registerpage.Clear Box in Register Page    2
TC_006 Verify input address city not display warning in Register page
    registerpage.Box in Register Page    3    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    3
    registerpage.Clear Box in Register Page    3
TC_007 Verify input address state not display warning in Register page
    registerpage.Box in Register Page    4    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    4
    registerpage.Clear Box in Register Page    4
TC_008 Verify input address zipCode not display warning in Register page
    registerpage.Box in Register Page    5    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    5
    registerpage.Clear Box in Register Page    5
TC_009 Verify input phoneNumber not display warning in Register page
    registerpage.Box in Register Page    6    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    6
    registerpage.Clear Box in Register Page    6
TC_010 Verify input ssn not display warning in Register page
    registerpage.Box in Register Page    7    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    7
    registerpage.Clear Box in Register Page    7
TC_011 Verify input username not display warning in Register page
    registerpage.Box in Register Page    8    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    8
    registerpage.Clear Box in Register Page    8
TC_012 Verify input password not display warning in Register page
    registerpage.Box in Register Page    9    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    9
    registerpage.Clear Box in Register Page    9
TC_013 Verify input repeatedPassword not display warning in Register page
    registerpage.Box in Register Page    10    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    10
    registerpage.Clear Box in Register Page    10
TC_014 Verify Password Not Match in Register page
    registerpage.Box in Register Page    9    ${NUMBER}
    registerpage.Box in Register Page    11    ${NUMBER}
    registerpage.Register Button
    registerpage.Check Error    911
TC_015 Verify Register Successfully in Register page
    registerpage.Input All information in Register Page    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Register Successfully    ${USERNAME}
TC_016 Verify Register Information was used in Register page
    common.Logout Button
    common.Register Button
    registerpage.Input All information in Register Page    ${NUMBER}
    registerpage.Register Button
    registerpage.Check Error    810
TC_017 Verify All mandatory field in Login page
    common.Login Button
    login.Verify Mandatory field in Login    1
    login.Clear Login Box
TC_018 Verify login fail due to for get input password in Login page
    login.Input One Box Login    username    ${USER}    ${NUMBER}
    common.Login Button
    login.Verify Mandatory field in Login    1
    login.Clear Login Box
TC_019 Verify login fail due to for get input username in Login page
    login.Input One Box Login    password    ${USER}    ${NUMBER}
    common.Login Button
    login.Verify Mandatory field in Login    1
    login.Clear Login Box
TC_020 Verify Login Successfully in Login page
    Sleep    5
    login.Input Username and Password    ${USER}    ${NUMBER}
    Sleep    10
    common.Login Button
    login.Verify Login Successfuly
TC_021 Verify All mandatory field in Forgot login info Page
    common.Logout Button
    common.Forgot login info? Button
    forgotlogin.Verify Navigate to Forgot Successfully
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    ${EMPTY}
TC_022 Verify input firstname not display warning in Forgot login info Page
    forgotlogin.Input information to Forgot Login Page    0    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    0
    forgotlogin.Clear Box in Register Page    0
TC_023 Verify input lastname not display warning in Forgot login info Page
    forgotlogin.Input information to Forgot Login Page    1    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    1
    forgotlogin.Clear Box in Register Page    1
TC_024 Verify input street not display warning in Forgot login info Page
    forgotlogin.Input information to Forgot Login Page    2    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    2
    forgotlogin.Clear Box in Register Page    2
TC_025 Verify input city not display warning in Forgot login info Page
    forgotlogin.Input information to Forgot Login Page    3    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    3
    forgotlogin.Clear Box in Register Page    3
TC_026 Verify input state not display warning in Forgot login info Page
    forgotlogin.Input information to Forgot Login Page    4    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    4
    forgotlogin.Clear Box in Register Page    4
TC_027 Verify input zipcode not display warning in Forgot login info Page
    forgotlogin.Input information to Forgot Login Page    5    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    5
    forgotlogin.Clear Box in Register Page    5
TC_028 Verify input ssn not display warning in Forgot login info Page
    forgotlogin.Input information to Forgot Login Page    6    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    6
    forgotlogin.Clear Box in Register Page    6
TC_029 Verify find my login fail in Forgot login info Page
    forgotlogin.Input All information in Forgot Login    ${NUMBER}
    forgotlogin.Input information to Forgot Login Page    7    ${NUMBER}
    forgotlogin.Find my login info Button
    common.Check Error    29
TC_030 Verify find my login Successfully in Forgot login info Page
    common.Forgot login info? Button
    Sleep    5
    forgotlogin.Input All information in Forgot Login    ${NUMBER}
    Sleep    5
    forgotlogin.Find my login info Button
    forgotlogin.Verify Find My Login Successfully
TC_031
    common.Open New Account Button
    newaccount.Verify Open New Account Tab
    newaccount.Select Type of Account    checking
    newaccount.Open New Account Button
    newaccount.Verify Open New Account Successfully
TC_032
    common.Open New Account Button
    newaccount.Verify Open New Account Tab
    newaccount.Select Type of Account    savings
    newaccount.Open New Account Button
    newaccount.Verify Open New Account Successfully
TC_033
    overview.Accounts Overview Button
    overview.Verify Accounts Overview Successfully
    overview.Select Account and Verify Accounts Detail Tab
TC_034
    common.Transfer Funds Button
    transfer.Verify Transfer Funds Successfully
    Sleep    5
    transfer.Transfer Button
    common.Check Error    34
TC_035
    common.Transfer Funds Button
    transfer.Verify Transfer Funds Successfully
    Sleep    5
    transfer.Input Amount Box    test
    transfer.Transfer Button
    common.Check Error    35
TC_036
    common.Transfer Funds Button
    transfer.Verify Transfer Funds Successfully
    Sleep    5
    transfer.Input Amount Box    ${AMOUNT}
    transfer.Transfer Button
    transfer.Verify Transfer Complete    ${AMOUNT}
TC_037
    common.Transfer Funds Button
    transfer.Verify Transfer Funds Successfully
    Sleep    5
    transfer.Input Amount Box    ${AMOUNT}
    transfer.Select From Account in Transfer Funds Tab    1
    transfer.Transfer Button
    transfer.Verify Transfer Complete    ${AMOUNT}
TC_038
    common.Transfer Funds Button
    transfer.Verify Transfer Funds Successfully
    Sleep    5
    transfer.Input Amount Box    ${AMOUNT}
    transfer.Select From Account in Transfer Funds Tab    1
    transfer.Select To Account in Transfer Funds Tab    2
    Sleep    20
    transfer.Transfer Button
    transfer.Verify Transfer Complete    ${AMOUNT}
TC_039
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    ${EMPTY}
TC_040
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    40
    billpay.Click Send Payment Button
    common.Check Error    40
TC_041
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    41
    billpay.Click Send Payment Button
    common.Check Error    41
TC_042
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    42
    billpay.Click Send Payment Button
    common.Check Error    42
TC_043
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    6
    billpay.Input data to box in Bill Pay Tab    43
    billpay.Click Send Payment Button
    common.Check Error    43
TC_044
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    0
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    0
TC_045
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    1
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    1
TC_046
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    2
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    2
TC_047
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    3
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    3
TC_048
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    4
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    4
TC_049
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    5
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    5
TC_050
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    6
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    6
TC_051
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    7
    billpay.Click Send Payment Button
    common.Check Error    51
TC_052
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    8
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    8
TC_053
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input data to box in Bill Pay Tab    53
    billpay.Click Send Payment Button
    common.Check Error    53
TC_054
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Select From Account in Bill Pay Tab    2
    billpay.Click Send Payment Button
    billpay.Verify Check Mandatory    ${EMPTY}
TC_055
    billpay.Click Bill Pay Tab
    billpay.Verify Bill Pay Tab Successfully
    billpay.Input All data to box in Bill Pay Tab
    billpay.Select From Account in Bill Pay Tab    3
    billpay.Click Send Payment Button
    billpay.Verify Bill Payment Complete