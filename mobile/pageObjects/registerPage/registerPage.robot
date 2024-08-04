*** Settings ***
Resource        ../base/base.robot
Resource        ../loginPage/loginPage.robot
Variables       register-page-locators.yaml

*** Variables ***
${USER_NAME}         jojotest
${USER_EMAIL}        jojo-test@test.com
${USER_PASSWORD}     jojotest123

*** Keywords ***
Verify Register Page Appears
    Wait Until Element Is Visible    ${name_input_field}
    Element Should Be Visible        ${email_input_field}
    Element Should Be Visible        ${password_input_field}
    Element Should Be Visible        ${confirm_password_input_field}
    Element Should Be Visible        ${register_button}
    Swipe To Bottom Of The Screen

Input User Name
    [Arguments]     ${user_name}=random
    IF    '${user_name}' == 'random'
        ${user_name}    Randomize User Name
    END
    Input Text      ${name_input_field}    ${user_name}
    Set Global Variable    ${USER_NAME}    ${user_name}

Input User Email
    [Arguments]     ${user_email}=random    ${user_name}=${USER_NAME}
    IF    '${user_email}' == 'random'
        ${user_email}    Randomize User Email    user_name=${user_name.replace(' ', '')}
    END
    Input Text      ${email_input_field}    ${user_email}
    Set Global Variable    ${USER_EMAIL}    ${user_email}

Input User Password
    [Arguments]     ${user_password}=random
    IF    '${user_password}' == 'random'
        ${user_password}    Randomize User Password
    END
    Input Text      ${password_input_field}    ${user_password}
    Set Global Variable    ${USER_PASSWORD}    ${user_password}

Input User Password Confirmation
    [Arguments]     ${user_password}=random
    IF    '${user_password}' == 'random'
        ${user_password}    Randomize User Password
    END
    Input Text      ${confirm_password_input_field}    ${user_password}
    
Click Register Button
    Click Element   ${register_button}

Verify Register Success Message Appears
    Wait Until Element Is Visible    ${register_success_message_text}

Verify Register Error Message Appears
    [Arguments]    ${error_message}=${null}
    Wait Until Element Is Visible    ${register_error_message_text.replace("{0}", "${error_message}")}

Swipe To Bottom Of The Screen
    Swipe By Percent                 start_x=50    start_y=70    end_x=50    end_y=50

Go To Login Page By Clicking Login Link
    [Arguments]    ${timeout}=5s
    Wait Until Page Does Not Contain Element   ${register_success_message_text}    timeout=${timeout}
    Click Element        ${login_link}

Register User With Valid Data
    Go To Register Page By Clicking Register Link
    Verify Register Page Appears
    Input User Name                     user_name=random
    Input User Email                    user_email=random
    Input User Password                 user_password=random
    Input User Password Confirmation    user_password=${USER_PASSWORD}
    Click Register Button
    Verify Register Success Message Appears
    Go To Login Page By Clicking Login Link
