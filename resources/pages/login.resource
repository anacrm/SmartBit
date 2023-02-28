*** Settings ***
Library     Browser


*** Keywords ***
Fill credentials
    [Arguments]    ${email}    ${password}

    Fill Text    input[placeholder="Seu e-mail"]    ${email}
    Fill Text    input[placeholder="Sua Senha"]    ${password}

Go to login page
    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/

Submit credentials
    Click    button >> text=Entrar no sistema

Field type should be email
    Get Attribute    input[placeholder="Seu e-mail"]    type    equal    email

Required field message should be
    [Arguments]    ${field}    ${requiredField_message}

    #Wait For Elements State    span >> text=${requiredField_message}    visible    5

    Get Text    xpath=//input[@type='${field}']/..//span    equal    ${requiredField_message}
