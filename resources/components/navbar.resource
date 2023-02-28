*** Settings ***
Documentation       Representation top menu

Library             Browser


*** Keywords ***
User should be logged in
    [Arguments]    ${user_name}

    ${logged_user}    Set Variable    aside strong

    Wait For Elements State    ${logged_user}    visible    5

    Get Text    ${logged_user}    equal    ${user_name}
    Get Url    contains    /alunos
