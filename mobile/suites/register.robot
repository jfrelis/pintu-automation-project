*** Settings ***
Resource        ../pageObjects/loginPage/loginPage.robot
Resource        ../pageObjects/registerPage/registerPage.robot
Resource        ../pageObjects/userInfoPage/userInfoPage.robot
Test Setup      Run Keywords      Open Login Register Application    
...    AND      Go To Register Page By Clicking Register Link
Test Teardown   Close Login Register Application

*** Test Cases ***
User Should Be Able To Register With Valid Data
    [Tags]    apps    apps:positive-case    apps:register    apps:TC-REG-001
    Verify Register Page Appears
    Input User Name                     user_name=random
    registerPage.Input User Email       user_email=random
    registerPage.Input User Password    user_password=random
    Input User Password Confirmation    user_password=${USER_PASSWORD}
    Click Register Button
    Verify Register Success Message Appears

User Should Not Be Able To Register With Registered Data
    # This case is expected to fail if executed as standalone for the first time due to not supported pre-defined data in the apps.
    [Tags]    apps    apps:negative-case    apps:register    apps:TC-REG-005
    Verify Register Page Appears
    Input User Name                          user_name=${USER_NAME}
    registerPage.Input User Email            user_email=${USER_EMAIL}
    registerPage.Input User Password         user_password=${USER_PASSWORD}
    Input User Password Confirmation         user_password=${USER_PASSWORD}
    Click Register Button
    Verify Register Error Message Appears    error_message=${email_already_exists_registration_error}

User Should Not Be Able To Register With Empty Name Data
    [Tags]    apps    apps:negative-case    apps:register    apps:TC-REG-002
    Verify Register Page Appears
    Input User Name                          user_name=${EMPTY}
    registerPage.Input User Email            user_email=random
    registerPage.Input User Password         user_password=random
    Input User Password Confirmation         user_password=${USER_PASSWORD}
    Click Register Button
    Verify Register Error Message Appears    error_message=${name_registration_error}

User Should Not Be Able To Register With Empty Email Data
    [Tags]    apps    apps:negative-case    apps:register    apps:TC-REG-003
    Verify Register Page Appears
    Input User Name                          user_name=random
    registerPage.Input User Email            user_email=${EMPTY}
    registerPage.Input User Password         user_password=random
    Input User Password Confirmation         user_password=${USER_PASSWORD}
    Click Register Button
    Verify Register Error Message Appears    error_message=${email_registration_error}

User Should Not Be Able To Register With Different Password And Confirm Password Data
    [Tags]    apps    apps:negative-case    apps:register    apps:TC-REG-004
    Verify Register Page Appears
    Input User Name                          user_name=random
    registerPage.Input User Email            user_email=random
    registerPage.Input User Password         user_password=random
    Input User Password Confirmation         user_password=random
    Click Register Button
    Verify Register Error Message Appears    error_message=${password_not_match_registration_error}
