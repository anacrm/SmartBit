*** Settings ***
Documentation       Enrolls test suite

Library             Browser
Resource            ../resources/base.resource


*** Test Cases ***
Shoul be possible to enroll new members
    ${admin}    Create Dictionary    email=admin@smartbit.com    password=qacademy    name=Admin

    Do Login    ${admin}

    Go to enrolls
    Go to form
    Select student    Falcão (Nao mexer)
    Select plan    Smart
    select start date

    Sleep    15
