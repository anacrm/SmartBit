*** Settings ***
Documentation       Suite Login

Resource            ../resources/base.resource


*** Test Cases ***
Should login
    ${falcao}    Get Fixture    falcao
    Start App
    Input Text    xpath=//android.widget.EditText[@text="Informe o endereço ip da api"]    ${API_URL}
    Input Text    xpath=//android.widget.EditText[@text="Informe seu código de acesso"]    ${falcao}[student][id]
    Click Text    Entrar    exact_match=true
    Wait Until Page Contains    Olá, ${falcao}[student][name]!
    Finish App
