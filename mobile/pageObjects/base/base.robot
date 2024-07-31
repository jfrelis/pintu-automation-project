*** Settings ***
Library        AppiumLibrary
Library        FakerLibrary    WITH NAME    faker
Variables      ../static-variables.yaml

*** Variables ***
${REMOTE_URL}            http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}         Android
${PLATFORM_VERSION}      12.0
${DEVICE_NAME}           emulator-5554
${APP_PACKAGE}           com.loginmodule.learning
${APP_ACTIVITY}          .activities.LoginActivity

*** Keywords ***
Open Login Register Application
    Open Application       ${REMOTE_URL}     
    ...                    platformName=${PLATFORM_NAME}    
    ...                    platformVersion=${PLATFORM_VERSION}    
    ...                    deviceName=${DEVICE_NAME}    
    ...                    appPackage=${APP_PACKAGE}    
    ...                    appActivity=${APP_ACTIVITY}
    ...                    noReset=${True}

Close Login Register Application
    Close Application

Randomize User Name
    ${user_name}    faker.Name
    RETURN    ${user_name}

Randomize User Email
    [Arguments]      ${user_name}
    ${random_num}    faker.Random Number    3
    ${user_email}    Set Variable        ${user_name}-test-${random_num}@test.com
    RETURN           ${user_email}

Randomize User Password
    ${user_pass}    faker.Password
    RETURN    ${user_pass}
