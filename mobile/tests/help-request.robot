*** Settings ***
Documentation       Suite Help request

Resource            ../resources/base.resource
Resource            ../resources/services/enrolls.resource

Test Setup          Start App
Task Teardown       Finish App


*** Test Cases ***
Should be possible request help
    ${admin}    Get Fixture    admin
    ${ana}    Get Fixture    ana

    Reset Student    ${ana}[student][email]

    ${token}    Get Service Token    ${admin}
    ${student_id}    POST New Student    ${token}    ${ana}[student]

    POST New Enrolls    ${token}    ${student_id}

    Login With Student Id    ${student_id}

    Wait Until Element Is Visible    id=android:id/button1    timeout=5
    Click Element    id=android:id/button1

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Pedir ajuda"]    timeout=5
    Click Element    xpath=//android.widget.TextView[@text="Pedir ajuda"]

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Enviar dúvida"]    timeout=5
    Click Element    xpath=//android.widget.TextView[@text="Enviar dúvida"]

    Wait Until Element Is Visible
    ...    xpath=//android.widget.EditText[@text="Escreva sua dúvida aqui"]
    ...    timeout=5
    Input Text    xpath=//android.widget.EditText[@text="Escreva sua dúvida aqui"]    ${ana}[help]
    Click Text    Enviar

    Wait Until Page Contains    Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.

    Sleep    3
