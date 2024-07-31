*** Settings ***
Resource        ../base/base.robot
Variables       user-info-page-locators.yaml

*** Keywords ***
Verify User Info Page Appears
    [Arguments]    ${email}    ${password}    ${name}
    Wait Until Element Is Visible    ${page_title_text}
    Element Should Be Visible        ${hello_title_text}
    Element Should Be Visible        ${email_title_text.replace("{0}", "${email}")}
    Element Should Be Visible        ${all_accounts_name_label}
    Element Should Be Visible        ${all_accounts_email_label}
    Element Should Be Visible        ${all_accounts_password_label}
    Element Should Be Visible        ${all_accounts_name_value_text.replace("{0}", "${name}")}
    Element Should Be Visible        ${all_accounts_email_value_text.replace("{0}", "${email}")}
    Element Should Be Visible        ${all_accounts_password_value_text.replace("{0}", "${password}")}
