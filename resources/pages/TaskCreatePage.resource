*** Settings ***
Documentation    Acoes do elemento da pagina de cadastro de tarefas

Library    Browser

*** Keywords ***
Submit task form
    [Arguments]    ${task}

    Fill Text    css=input[name=name]    ${task}[name]

    ${tags_element}    Set Variable    css=input[name=tags]

    FOR    ${tag}    IN    @{task}[tags]
        Fill Text    ${tags_element}    ${tag}
        Sleep    1    #Thinking time
        Press Keys    ${tags_element}    Enter
    END

    Click    css=button >> text=Cadastrar