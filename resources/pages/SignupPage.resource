*** Settings ***
Documentation    Elementos e acoes da pagina de cadastro

Library    Browser

Resource    ../env.resource

*** Keywords ***
Go to signup page
    Go To    ${BASE_URL}/signup

    #Checkpoint technical validation
    Wait For Elements State    css=h1    visible    5
    Get Text                   css=h1    equal      Faça seu cadastro

Submit signup form
    [Arguments]    ${user}

    Fill Text    id=name        ${user}[name]
    Fill Text    id=email       ${user}[email]
    Fill Text    id=password    ${user}[password]

    Click    css=button[type=submit] >> text=Cadastrar