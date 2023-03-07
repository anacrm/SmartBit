*** Settings ***
Documentation       Enrolls test suite

Library             Browser
Resource            ../resources/base.resource
Resource            ../resources/database.resource


*** Test Cases ***
Shoul be possible to enroll new members
    ${admin}    Get Fixture    admin

    ${student}    Get Fixture    student

    Reset Student Enroll    ${student}[email]

    Do Login    ${admin}

    Go to enrolls
    Go to form
    Select student    ${student}[name]
    Select plan    ${student}[enroll][plan]
    Select start date
    Save enroll form
    Toaster validation    Matrícula cadastrada com sucesso
