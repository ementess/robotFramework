*** Settings ***
Library               RequestsLibrary

*** Variables ***
${targetURL}    https://api.restful-api.dev/objects


*** Test Cases ***
GET REQUEST TO RECEIVE 200 OK
    [Documentation]  If response code is 400, test will be failed directly. Else if status is 200, test will be passed. For other statuses, test will be failed again.
    Create Session  getRequest    ${targetURL}
    ${response}=    GET On Session  getRequest  ${targetURL}   expected_status=Anything
    Run Keyword if  ${response.status_code}==400    Fail  Response Code is 400!
    Status should be   200  ${response}

#Below test added to demonstrate 400 BAD Request check
POST REQUEST TO RECEIVE 400 BAD REQUEST
    [Documentation]  If response code is 400, test will be failed directly. Else if status is 200, test will be passed. For other statuses, test will be failed again.
    Create Session  postRequest    ${targetURL}
    ${response}=    POST On Session  getRequest  ${targetURL}   expected_status=Anything
    Run Keyword if  ${response.status_code}==400    Fail  Response Code is 400!
    Status should be   200  ${response}

