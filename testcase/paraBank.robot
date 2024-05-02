*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/common.robot
Resource    ../keywords/registerpage.robot
Resource    ../keywords/login.robot
Resource    ../keywords/forgotlogin.robot

Suite Setup    common.Open Browser ParaBank
Suite Teardown   Close All Browsers
*** Variables ***

${NUMBER}    Test801
${USERNAME}    username${NUMBER}
${USER}    pro_file
${AMOUNT}    1000
${EMPTY}
*** Test Cases ***
TC_001 Verify system navigate to register page
    common.Register Page
    registerpage.Verify Register Page display Successfully
TC_002 Verify All mandatory field in Register page
    registerpage.Register Button
    registerpage.Verify Check Mandatory    ${EMPTY}
TC_003 Verify input firstname not display warning
    registerpage.Box in Register Page    0    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    0
    registerpage.Clear Box in Register Page    0
TC_004 Verify input lasttname not display warning
    registerpage.Box in Register Page    1    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    1
    registerpage.Clear Box in Register Page    1

TC_005 Verify input address street not display warning
    registerpage.Box in Register Page    2    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    2
    registerpage.Clear Box in Register Page    2
TC_006 Verify input address city not display warning
    registerpage.Box in Register Page    3    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    3
    registerpage.Clear Box in Register Page    3
TC_007 Verify input address state not display warning
    registerpage.Box in Register Page    4    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    4
    registerpage.Clear Box in Register Page    4
TC_008 Verify input address zipCode not display warning
    registerpage.Box in Register Page    5    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    5
    registerpage.Clear Box in Register Page    5
TC_009 Verify input phoneNumber not display warning
    registerpage.Box in Register Page    6    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    6
    registerpage.Clear Box in Register Page    6
TC_010 Verify input ssn not display warning
    registerpage.Box in Register Page    7    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    7
    registerpage.Clear Box in Register Page    7
TC_011 Verify input username not display warning
    registerpage.Box in Register Page    8    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    8
    registerpage.Clear Box in Register Page    8
TC_012 Verify input password not display warning
    registerpage.Box in Register Page    9    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    9
    registerpage.Clear Box in Register Page    9
TC_013 Verify input repeatedPassword not display warning
    registerpage.Box in Register Page    10    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Check Mandatory    10
    registerpage.Clear Box in Register Page    10
TC_014 Verify Password Not Match
    registerpage.Box in Register Page    9    ${NUMBER}
    registerpage.Box in Register Page    11    ${NUMBER}
    registerpage.Register Button
    registerpage.Check Error    911
TC_015 Verify Register Successfully
    registerpage.Input All information in Register Page    ${NUMBER}
    registerpage.Register Button
    registerpage.Verify Register Successfully    ${USERNAME}
TC_016 Verify Register Information was used
    common.Logout Button
    common.Register Page
    registerpage.Input All information in Register Page    ${NUMBER}
    registerpage.Register Button
    registerpage.Check Error    810
TC_017 Verify All mandatory field in Login page
    login.Login Button
    login.Verify Mandatory field in Login    1
    login.Clear Login Box
TC_018 Verify login fail due to for get input password
    login.Input One Box Login    username    ${USER}    ${NUMBER}
    login.Login Button
    login.Verify Mandatory field in Login    1
    login.Clear Login Box
TC_019 Verify login fail due to for get input username
    login.Input One Box Login    password    ${USER}    ${NUMBER}
    login.Login Button
    login.Verify Mandatory field in Login    1
    login.Clear Login Box
TC_020 Verify Login Successfully
    Sleep    5
    login.Input Username and Password    ${USER}    ${NUMBER}
    Sleep    10
    login.Login Button
    login.Verify Login Successfuly
TC_021
    common.Logout Button
    common.Forgot login info? Button
    forgotlogin.Verify Navigate to Forgot Successfully
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    ${EMPTY}
TC_022
    forgotlogin.Input information to Forgot Login Page    0    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    0
    forgotlogin.Clear Box in Register Page    0
TC_023
    forgotlogin.Input information to Forgot Login Page    1    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    1
    forgotlogin.Clear Box in Register Page    1
TC_024
    forgotlogin.Input information to Forgot Login Page    2    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    2
    forgotlogin.Clear Box in Register Page    2
TC_025
    forgotlogin.Input information to Forgot Login Page    3    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    3
    forgotlogin.Clear Box in Register Page    3
TC_026
    forgotlogin.Input information to Forgot Login Page    4    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    4
    forgotlogin.Clear Box in Register Page    4
TC_027
    forgotlogin.Input information to Forgot Login Page    5    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    5
    forgotlogin.Clear Box in Register Page    5
TC_028
    forgotlogin.Input information to Forgot Login Page    6    ${NUMBER}
    forgotlogin.Find my login info Button
    forgotlogin.Verify Mandatory in Findmylogin    6
    forgotlogin.Clear Box in Register Page    6
TC_029
    forgotlogin.Input All information in Forgot Login    ${NUMBER}
    forgotlogin.Input information to Forgot Login Page    7    ${NUMBER}
    forgotlogin.Find my login info Button
    common.Check Error    29
TC_030
    common.Forgot login info? Button
    Sleep    5
    forgotlogin.Input All information in Forgot Login    ${NUMBER}
    Sleep    5
    forgotlogin.Find my login info Button
    forgotlogin.Verify Find My Login Successfully
    #common.Logout Button
TC_031
    #Sleep    3
    #login.Input Username and Password    ${USER}    ${NUMBER}
    #Sleep    3
    #login.Login Button
    #login.Verify Login Successfuly
    login.Open New Account Button on Left Bar
    login.Verify Open New Account Tab
    login.Select Type of Account    checking
    login.Open New Account Button
    login.Verify Open New Account Successfully
TC_032
    login.Open New Account Button on Left Bar
    login.Verify Open New Account Tab
    login.Select Type of Account    savings
    login.Open New Account Button
    login.Verify Open New Account Successfully
TC_033
    login.Accounts Overview Button on Left Bar
    #login.Select Account and Verify Accounts Detail Tab
#TC_034
    #login.Transfer Funds Button on Left Bar
    #login.Transfer Button
    #Sleep    5s
    #common.Check Error    34
TC_035
    login.Transfer Funds Button on Left Bar
    login.Input Amount Box    test
    login.Transfer Button
    Sleep    5s
    common.Check Error    35
TC_036
    login.Transfer Funds Button on Left Bar
    login.Input Amount Box    ${AMOUNT}
    login.Transfer Button
    login.Verify Transfer Complete    ${AMOUNT}
    Sleep    30
#TC_037