*** Settings ***
Documentation       Consuming API rest

Library             RequestsLibrary
Resource            ../base.resource


*** Keywords ***
POST New Student
    [Arguments]    ${token}    ${student}

    ${headers}    Create Dictionary    Authorization=${token}
    ${admin}    Get Fixture    admin

    ${response}    POST    http://localhost:3333/students
    ...    json=${student}
    ...    headers=${headers}
    ...    expected_status=201

    RETURN    ${response.json()}[id]
