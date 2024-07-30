*** Settings ***
Resource    ../keywords/postDataKeywords.robot

*** Test Cases ***
Endpoint Creates Data Successfully With A Full Request Body
    [Tags]    post    post:positive-case    post:TC-API-001
    ${userId}    Randomize Number
    ${status}  ${resp_body}    ${req_body}    Access POST Endpoint    title=recommend    body=motorcycle    userId=${userId}
    Verify Response Data Is Not Null    response=${resp_body}
    Verify Response Data Matches The Request Data    response=${resp_body}    request=${req_body}

Endpoint Creates Data Successfully With A Partial Request Body
    [Tags]    post    post:negative-case    post:TC-API-002
    ${userId}    Randomize Number
    ${status}  ${resp_body}    ${req_body}    Access POST Endpoint    title=recommend    userId=${userId}
    Verify Response Data Is Not Null    response=${resp_body}
    Verify Response Data Matches The Request Data    response=${resp_body}    request=${req_body}


Endpoint Creates Data Successfully With An Empty Request Body
    [Tags]    post    post:negative-case    post:TC-API-003
    ${userId}    Randomize Number
    ${status}  ${resp_body}    ${req_body}    Access POST Endpoint
    Verify Response Data Is Not Null    response=${resp_body}
    Verify Response Data Matches The Request Data    response=${resp_body}    request=${req_body}
