*** Settings ***
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
    [Tags]    apps    apps:negative-case    apps:register    apps:TC-REG-005
    [Setup]   Run Keywords      Open Login Register Application     
    ...    AND    Register User With Valid Data    
    ...    AND    Go To Register Page By Clicking Register Link
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
    Verify Register Error Message Appears    error_message=${email_not_valid_error}

User Should Not Be Able To Register With Empty Password Data
    [Tags]    apps    apps:negative-case    apps:register    apps:TC-REG-006
    Verify Register Page Appears
    Input User Name                          user_name=random
    registerPage.Input User Email            user_email=random
    registerPage.Input User Password         user_password=${EMPTY}
    Input User Password Confirmation         user_password=${USER_PASSWORD}
    Click Register Button
    Verify Register Error Message Appears    error_message=${password_empty_error}    

User Should Not Be Able To Register With Different Password And Confirm Password Data
    [Tags]    apps    apps:negative-case    apps:register    apps:TC-REG-004
    Verify Register Page Appears
    Input User Name                          user_name=random
    registerPage.Input User Email            user_email=random
    registerPage.Input User Password         user_password=random
    Input User Password Confirmation         user_password=random
    Click Register Button
    Verify Register Error Message Appears    error_message=${password_not_match_registration_error}

User Should Not Be Able To Register With SQL Injection Potential In Name Data
    [Tags]    apps    apps:negative-case    apps:register    apps:TC-REG-007    BUG-002
    Verify Register Page Appears
    Input User Name                          user_name=;delete from users --
    registerPage.Input User Email            user_email=test@test.com
    registerPage.Input User Password         user_password=random
    Input User Password Confirmation         user_password=${USER_PASSWORD}
    Click Register Button
    Verify Register Error Message Appears    error_message=${name_registration_error}

User Should Not Be Able To Register With SQL Injection Potential In Email Data
    [Tags]    apps    apps:negative-case    apps:register    apps:TC-REG-008
    Verify Register Page Appears
    Input User Name                          user_name=random
    registerPage.Input User Email            user_email=test@test.com); delete from users --
    registerPage.Input User Password         user_password=random
    Input User Password Confirmation         user_password=${USER_PASSWORD}
    Click Register Button
    Verify Register Error Message Appears    error_message=${email_not_valid_error}
