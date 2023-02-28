*** Settings ***
Documentation       Representation toaster component

Library             Browser


*** Keywords ***
Toaster validation
    [Arguments]    ${toaster_message}

    Wait For Elements State    .Toastify__toast-body div >> text=${toaster_message}    visible    5

    Wait For Elements State    .Toastify__toast-body div    detached    10
