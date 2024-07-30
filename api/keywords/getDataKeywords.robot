*** Settings ***
Resource        base.robot

*** Keywords ***
Verify Response Key Have The Correct Data Type
    [Arguments]    ${response}
    ${data_length}    Get Length    ${response}
    IF    "${response.__class__.__name__}" == "dict"
        ${response}       Create List    ${response}
        ${data_length}    Get Length     ${response}
    END
    FOR   ${i}    IN RANGE    ${data_length}
        Exit For Loop If    ${i} == ${data_length}
        ${is_userId_int}    Evaluate    "${response[${i}]['userId'].__class__.__name__}" == "int"
        ${is_id_int}        Evaluate    "${response[${i}]['id'].__class__.__name__}" == "int"
        ${is_title_str}     Evaluate    "${response[${i}]['title'].__class__.__name__}" == "str"
        ${is_body_str}      Evaluate    "${response[${i}]['body'].__class__.__name__}" == "str"
        Should Be True      ${is_userId_int}
        Should Be True      ${is_id_int}
        Should Be True      ${is_title_str}
        Should Be True      ${is_body_str}
    END
