*** Settings ***
Resource    ../keywords/postDataKeywords.robot 

*** Test Cases ***
Endpoint Creates Data Successfully With A Full Request Body
    [Tags]    api    post    post:positive-case    post:TC-API-001
    ${userId}    Randomize Number
    ${status}  ${resp_body}    ${req_body}    Access POST Endpoint    title=recommend    body=motorcycle    userId=${userId}
    Verify Response Data Is Not Null    response=${resp_body}
    Verify Response Data Matches The Request Data    response=${resp_body}    request=${req_body}

Endpoint Creates Data Successfully With A Partial Request Body
    [Tags]    api    post    post:negative-case    post:TC-API-002
    ${userId}    Randomize Number
    ${status}  ${resp_body}    ${req_body}    Access POST Endpoint    title=recommend    userId=${userId}
    Verify Response Data Is Not Null    response=${resp_body}
    Verify Response Data Matches The Request Data    response=${resp_body}    request=${req_body}

Endpoint Creates Data Successfully With An Empty Request Body
    [Tags]    api    post    post:negative-case    post:TC-API-003
    ${userId}    Randomize Number
    ${status}  ${resp_body}    ${req_body}    Access POST Endpoint
    Verify Response Data Is Not Null    response=${resp_body}
    Verify Response Data Matches The Request Data    response=${resp_body}    request=${req_body}

Endpoint Does Not Create Data Successfully With A Request Body Containing Suspicious Characters
    [Tags]    api    post    post:negative-case    post:TC-API-004    BUG-001
    ${userId}    Randomize Number
    ${status}  ${resp_body}    ${req_body}    Access POST Endpoint    title=..//    body=..//    userId=..//
    Verify Response Data Is Not Null    response=${resp_body}
    Verify Endpoint Is Return Expected Status      status=${internal_server_error_status}    response=${status}

Endpoint Does Not Create Data Successfully With A New Additional Key
    [Tags]    api    post    post:negative-case    post:TC-API-005    BUG-002
    ${userId}    Randomize Number
    ${status}  ${resp_body}    ${req_body}    Access POST Endpoint    title=..//    body=..//    userId=..//    newKey=new
    Verify Response Data Is Not Null    response=${resp_body}
    Verify Endpoint Is Return Expected Status      status=${internal_server_error_status}    response=${status}
