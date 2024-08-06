*** Settings ***
Resource        base.robot

*** Keywords ***
Verify Response Data Matches The Request Data
    [Arguments]    ${response}    ${request}
    IF    'userId' in ${response}
         ${is_userId_match}    Evaluate    "${response["userId"]}"=="${request["userId"][0]}"
         Should Be True        ${is_userId_match}
    END
    IF    'title' in ${response}
        ${is_title_match}     Evaluate    "${response["title"]}"=="${request["title"]}"
        Should Be True        ${is_title_match}
    END
    IF    'body' in ${response}
        ${is_body_match}      Evaluate    "${response["body"]}"=="${request["body"]}"
        Should Be True        ${is_body_match}
    END
