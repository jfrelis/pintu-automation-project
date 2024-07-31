*** Settings ***
Resource        ../base/base.robot
Variables       login-page-locators.yaml

*** Variables ***
${VALID_PREDEFINED_EMAIL}        jojo-test@test.com
${VALID_PREDEFINED_PASS}         jojotest123
${VALID_PREDEFINED_NAME}         jojotest

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

