*** Settings ***
Resource    ../keywords/getDataKeywords.robot

*** Test Cases ***
Endpoint Retrieves Single Data Successfully With A Valid URL
    [Tags]    api    get    get:positive-case    get:TC-API-001
    ${status}    ${resp_body}    Access GET Endpoint    id=12    status=${ok_get_status}
    Verify Endpoint Is Return Expected Status      status=${ok_get_status}    response=${status}
    Verify Response Data Is Not Null           response=${resp_body}
    Verify Response Key Have The Correct Data Type    response=${resp_body}

Endpoint Retrieves All Data Successfully With A Valid URL
    [Tags]    api    get    get:positive-case    get:TC-API-002
    ${status}    ${resp_body}    Access GET Endpoint    id=All    status=${ok_get_status}
    Verify Endpoint Is Return Expected Status      status=${ok_get_status}    response=${status}
    Verify Response Data Is Not Null           response=${resp_body}
    Verify Response Key Have The Correct Data Type    response=${resp_body}

Endpoint Does Not Retrieve Any Data With An Invalid URL
    [Tags]    api    get    get:negative-case    get:TC-API-003
    ${status}    ${body}    Access GET Endpoint    id=haha    status=${not_found_status}
    Verify Endpoint Is Return Expected Status      status=${not_found_status}    response=${status}
