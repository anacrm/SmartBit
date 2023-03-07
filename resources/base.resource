*** Settings ***
Documentation       All resources

Resource            components/navbar.resource
Resource            components/toaster.resource
Resource            pages/login.resource
Resource            pages/enroll.resource
Resource            database.resource
Library             JSONLibrary


*** Keywords ***
#Helpers

Do Login
    [Arguments]    ${user}

    Go to login page
    Fill credentials    ${user}[email]    ${user}[password]
    Submit credentials

    User should be logged in    ${user}[name]

Get Fixture
    [Arguments]    ${fixture_file}

    ${fixture}    Load Json From File    ${EXECDIR}/resources/fixtures/${fixture_file}.json    encoding=UTF-8

    RETURN    ${fixture}
