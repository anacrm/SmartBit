*** Settings ***
Documentation       Suite Login

Resource            ../resources/base.resource

Test Setup          Start App
Task Teardown       Finish App


*** Variables ***
${error_401}    Acesso não autorizado! Entre em contato com a equipe de atendimento.


*** Test Cases ***
Should login
    ${falcao}    Get Fixture    falcao

    Login With Student Id    ${falcao}[student][id]
    Wait Until Page Contains    Olá, ${falcao}[student][name]!

Invalid student id
    Login With Student Id    9999
    Wait Until Page Contains    ${error_401}

Negative student id
    Login With Student Id    -1
    Wait Until Page Contains    ${error_401}

Alphanumeric student id
    Login With Student Id    hd43345
    Wait Until Page Contains    ${error_401}
