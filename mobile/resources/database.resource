*** Settings ***
Documentation       Managing the test data through database

Library             DatabaseLibrary


*** Keywords ***
Connect to Postgress
    Connect To Database
    ...    psycopg2
    ...    npjapgmz
    ...    npjapgmz
    ...    4WPNKF8JDSGDzm7GBbrEek0pYMBR8PUn
    ...    mouse.db.elephantsql.com
    ...    5432

Select student Where email
    [Arguments]    ${email}

    ${query}    Set Variable    SELECT * FROM public.students WHERE email='${email}'

    ${result}    Query    ${query}

    RETURN    ${result}[0]

Delete Enroll By email
    [Arguments]    ${email}

    ${user}    Select student Where email    ${email}

    ${query}    Set Variable    DELETE FROM public.enrollments WHERE student_id = '${user}[0]'

    Execute Sql String    ${query}

Reset Student
    [Arguments]    ${email}

    Connect to Postgress
    Delete Student By Email    ${email}
    Disconnect From Database

Delete Student By Email
    [Arguments]    ${email}

    ${query}    Set Variable    DELETE FROM public.students WHERE email = '${email}'
    Execute Sql String    ${query}
