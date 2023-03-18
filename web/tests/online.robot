*** Settings ***
Documentation       To check if the the app is online

Library             Browser


*** Test Cases ***
Admin page should be onlineNew Page
    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/
    Get Text    h1    contains    Painel do Administrador
    Sleep    5
