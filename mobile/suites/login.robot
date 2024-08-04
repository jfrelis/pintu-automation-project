*** Settings ***
Resource        ../pageObjects/loginPage/loginPage.robot
Resource        ../pageObjects/userInfoPage/userInfoPage.robot
Test Setup      Open Login Register Application
Test Teardown   Close Login Register Application

*** Test Cases ***
User Should Be Able To Login With Registered Data
    [Tags]    apps    apps:positive-case    apps:login    apps:TC-LOG-001
    [Setup]   Run Keywords     Open Login Register Application     AND     Register User With Valid Data
    Verify Login Page Appears
    loginPage.Input User Email        email=${USER_EMAIL}
    loginPage.Input User Password     password=${USER_PASSWORD}
    Click Login Button
    Verify User Info Page Appears    email=${USER_EMAIL}    password=${USER_PASSWORD}    name=${USER_NAME}

User Should Not Be Able To Login With Unregistered Data
    [Tags]    apps    apps:negative-case    apps:login    apps:TC-LOG-002
    Verify Login Page Appears
    loginPage.Input User Email        email=${PREDEFINED_EMAIL}
    loginPage.Input User Password     password=${PREDEFINED_PASS}
    Click Login Button
    Verify Login Error Message Appears    error_message=${wrong_data_login_error}

User Should Not Be Able To Login With Empty Email Data
    [Tags]    apps    apps:negative-case    apps:login    apps:TC-LOG-003
    Verify Login Page Appears
    loginPage.Input User Email        email=${EMPTY}
    loginPage.Input User Password     password=${PREDEFINED_PASS}
    Click Login Button
    Verify Login Error Message Appears    error_message=${email_not_valid_error}

User Should Not Be Able To Login With Empty Password Data
    [Tags]    apps    apps:negative-case    apps:login    apps:TC-LOG-004    BUG-001
    Verify Login Page Appears
    loginPage.Input User Email        email=${PREDEFINED_EMAIL}
    loginPage.Input User Password     password=${EMPTY}
    Click Login Button
    Verify Login Error Message Appears    error_message=${password_empty_error}

User Should Not Be Able To Login With Special Character Email Data
    [Tags]    apps    apps:negative-case    apps:login    apps:TC-LOG-005
    Verify Login Page Appears
    loginPage.Input User Email        email=.,?
    loginPage.Input User Password     password=${PREDEFINED_PASS}
    Click Login Button
    Verify Login Error Message Appears    error_message=${email_not_valid_error}

User Should Not Be Able To Login With SQL Injection Potential
    [Tags]    apps    apps:negative-case    apps:login    apps:TC-LOG-006
    Verify Login Page Appears
    loginPage.Input User Email        email=105 OR 1=1
    loginPage.Input User Password     password=${PREDEFINED_PASS}
    Click Login Button
    Verify Login Error Message Appears    error_message=${email_not_valid_error}
