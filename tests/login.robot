*** Settings ***
Documentation       Autentication test suite

Library             Browser
Resource            ../resources/base.resource


*** Test Cases ***
Admin Login
    Go to login page
    Fill credentials    admin@smartbit.com    qacademy
    Submit credentials

    User should be logged in    Admin

Email isn't register in the system
    Go to login page
    Fill credentials    404@smartbit.com    qacademy
    Submit credentials

    Toaster validation    Suas credenciais são inválidas, por favor tente novamente!

Invalid password
    Go to login page
    Fill credentials    admin@smartbit.com    123password
    Submit credentials

    Toaster validation    Suas credenciais são inválidas, por favor tente novamente!

Invalid email format
    Go to login page
    Fill credentials    @com.br    qacademy
    Submit credentials
    Field type should be email

Empty password
    Go to login page
    Fill credentials    admin@smartbit.com    ${EMPTY}
    Submit credentials
    Required field message should be    password    A senha é obrigatória

Empty email
    Go to login page
    Fill credentials    ${EMPTY}    123password
    Submit credentials
    Required field message should be    email    O e-mail é obrigatório

Required fiels
    Go to login page
    Submit credentials
    Required field message should be    email    O e-mail é obrigatório
    Required field message should be    password    A senha é obrigatória
