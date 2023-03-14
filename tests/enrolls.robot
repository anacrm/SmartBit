*** Settings ***
Documentation       Enrolls test suite

Library             Browser
Resource            ../resources/base.resource
Resource            ../resources/database.resource


*** Test Cases ***
Testando API
    [Tags]    api

    ${admin}    Get Fixture    admin
    ${falcao}    Get Fixture    falcao

    Reset Student    ${falcao}[student][email]

    ${token}    Get Service Token    ${admin}

    POST New Student    ${token}    ${falcao}[student]

Shoul be possible to enroll new member
    ${admin}    Get Fixture    admin

    ${falcao}    Get Fixture    falcao

    Reset Student    ${falcao}[student][email]
    ${token}    Get Service Token    ${admin}

    POST New Student    ${token}    ${falcao}[student]

    Do Login    ${admin}

    Go to enrolls
    Go to form
    Select student    ${falcao}[student][name]
    Select plan    ${falcao}[enroll][plan]
    Select start date
    Save enroll form
    Toaster validation    Matrícula cadastrada com sucesso
