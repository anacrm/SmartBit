*** Settings ***
Library     Browser
Library     libs/DateTricks.py


*** Keywords ***
Go to enrolls
    Click    css=a[href="/matriculas"]

Go to form
    Click    css=a[href="/matriculas/new"]

Select student
    [Arguments]    ${student_name}
    Fill Text    xpath=//div[contains(text(),"Digite o nome do aluno")]/..//input    Falcão (Nao mexer)
    Click    css=div[class*="option"] >> text=${student_name}

Select plan
    [Arguments]    ${student_plan}
    Click    xpath=//label[text()="PLANO"]/..//div[contains(text(),"Selecione")]
    Click    css=div[class*="option"] >> text=${student_plan}

Select start date
    Focus    input[name="start_date"]
    ${start_date}    Get Start Date

    FOR    ${number}    IN    @{start_date}
        Keyboard Key    press    ${number}
    END

Save enroll form
    Click    button >> text=Salvar
