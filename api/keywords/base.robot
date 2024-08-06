*** Settings ***
Library            RequestsLibrary
Library            JSONLibrary
Variables          ../variables/static.yaml

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com
${PATH}        posts

*** Keywords ***
Access ${method} Endpoint
    [Arguments]    ${id}=${null}    ${status}=${null}    ${title}=${null}    ${body}=${null}    ${userId}=${null}    ${newKey}=${null}
    IF  "${method}" == "GET"
        IF    "${id}" != "All"
              ${id}    Set Variable    ${id}
        ELSE
              ${id}    Set Variable    ${EMPTY}
        END
        ${response}    GET     ${BASE_URL}/${PATH}/${id}    expected_status=${status}
        ${status}             Set Variable    ${response}
        ${resp_body}          Convert String To Json    ${response.content}
        RETURN       ${status}    ${resp_body}
    ELSE IF    "${method}" == "POST"
        IF     "${newKey}" == "${null}"
            ${req_body}    Request Body Constructor    title=${title}    body=${body}    userId=${userId}
        ELSE
            ${req_body}    Request Body Constructor    title=${title}    body=${body}    userId=${userId}    newKey=${newKey}
        END  
        ${response}    POST    ${BASE_URL}/${PATH}    data=${req_body}
        ${status}             Set Variable    ${response}
        ${resp_body}          Convert String To Json    ${response.content}
        RETURN       ${status}    ${resp_body}    ${req_body}
    END

Verify Endpoint Is Return Expected Status
    [Arguments]    ${status}    ${response}
    Status Should Be    expected_status=${status}    response=${response}

Randomize Number
    [Arguments]    ${total}=1
    ${numbers}    Evaluate    random.sample(range(11, 99), ${total})    random
    RETURN        ${numbers}

Request Body Constructor
    [Arguments]    ${title}=${null}    ${body}=${null}    ${userId}=${null}    ${newKey}=${null}
    IF    "${newKey}" == "${null}"
        ${request_body}    Create Dictionary    title=${title}    body=${body}    userId=${userId}
    ELSE
        ${request_body}    Create Dictionary    title=${title}    body=${body}    userId=${userId}    newKey=${newKey}
    END
    RETURN    ${request_body}

Verify Response Data Is Not Null
    [Arguments]    ${response}
    Should Not Be Empty    ${response}
