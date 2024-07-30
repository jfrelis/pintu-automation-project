*** Settings ***
Resource        base.robot

*** Keywords ***
Verify Response Data Matches The Request Data
    [Arguments]    ${response}    ${request}
    ${keys}        Set Variable   userId    title    body
    FOR    ${key}    IN    @{keys}
        IF    '${key}' in ${response}
            ${is_match}    Evaluate    "${response['${key}']}" == "${request['${key}']}"
            Should Be True    ${is_match}
        END
    END
