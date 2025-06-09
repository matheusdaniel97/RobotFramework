*** Settings ***
Documentation    Elementos da pagina de Login

Library    Browser

*** Keywords ***
Submit login form
    [Arguments]    ${user}

    Fill Text    id=email    ${user}[email]
    Fill Text    id=password    ${user}[password]
    Click    css=button >> text=Entrar
