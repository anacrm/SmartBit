*** Settings ***
Documentation       Main file

Library             AppiumLibrary
Library             JSONLibrary
Resource            screens/login.resource
Resource            services/sessions.resource
Resource            services/students.resource
Resource            database.resource


*** Keywords ***
Start App
    Open Application    http://localhost:4723/wd/hub
    ...    alias=SmartBit
    ...    automationName=UiAutomator2
    ...    platformName=Android
    ...    deviceName=Android Simulator
    ...    app=${EXECDIR}/app/smartbit-beta.apk
    ...    udid=emulator-5554
    ...    autoGrantPermissions=true

    Wait Until Page Contains    Informe seu código de acesso

Finish App
    Capture Page Screenshot
    Close Application
#Helpers

Get Fixture
    [Arguments]    ${fixture_file}

    ${fixture}    Load Json From File    ${EXECDIR}/resources/fixtures/${fixture_file}.json    encoding=UTF-8

    RETURN    ${fixture}

#robot -d ./logs tests/login.robot
