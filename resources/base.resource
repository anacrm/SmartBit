*** Settings ***
Documentation       All resources

Resource            components/navbar.resource
Resource            components/toaster.resource
Resource            pages/login.resource
Resource            pages/enroll.resource


*** Keywords ***
#Helpers

Do Login
    [Arguments]    ${user}

    Go to login page
    Fill credentials    ${user}[email]    ${user}[password]
    Submit credentials

    User should be logged in    ${user}[name]
