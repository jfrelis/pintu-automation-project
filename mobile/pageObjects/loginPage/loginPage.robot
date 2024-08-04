*** Settings ***
Resource        ../base/base.robot
Resource        ../registerPage/registerPage.robot
Variables       login-page-locators.yaml

*** Variables ***
${PREDEFINED_EMAIL}        jojo-test@test.com
${PREDEFINED_PASS}         jojotest123
${PREDEFINED_NAME}         jojotest

*** Keywords ***
Verify Login Page Appears
    Wait Until Element Is Visible    ${email_input_field}
    Element Should Be Visible        ${password_input_field}
    Element Should Be Visible        ${login_button}
    Element Should Be Visible        ${register_link}

Input User Email
    [Arguments]    ${email}
    Input Text     ${email_input_field}    ${email}

Input User Password
    [Arguments]    ${password}
    Input Text     ${password_input_field}    ${password}

Go To Register Page By Clicking Register Link
    Click Element    ${register_link}

Click Login Button
    Click Element    ${login_button}

Verify Login Error Message Appears
    [Arguments]    ${error_message}=${null}
    Wait Until Element Is Visible        ${login_error_message_text.replace("{0}", "${error_message}")}
