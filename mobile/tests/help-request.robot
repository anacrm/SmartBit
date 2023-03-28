*** Settings ***
Documentation       Suite Help request

Resource            ../resources/base.resource

Test Setup          Start App
Task Teardown       Finish App


*** Test Cases ***
Should be possible request help
    ${admin}    Get Fixture    admin
    ${ana}    Get Fixture    ana

    Reset Student    ${ana}[student][email]

    ${token}    Get Service Token    ${admin}
    POST New Student    ${token}    ${ana}[student]
