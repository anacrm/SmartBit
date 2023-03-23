*** Settings ***
Documentation       Login file

Library             AppiumLibrary
Library             JSONLibrary


*** Variables ***
${API_URL}      http://192.168.117.152:3333


*** Keywords ***
Login With Student Id
    [Arguments]    ${student_id}
    Input Text    xpath=//android.widget.EditText[@text="Informe o endereço ip da api"]    ${API_URL}
    Input Text    xpath=//android.widget.EditText[@text="Informe seu código de acesso"]    ${student_id}
    Click Text    Entrar    exact_match=true
