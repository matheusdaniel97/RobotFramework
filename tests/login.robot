*** Settings ***
Documentation    Suíte de testes de autenticação

Library    Collections

Resource    ../resources/base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder logar com usuário cadastrado

    ${user}    Create Dictionary
    ...    name=Matheus TestLogin
    ...    email=ganzenmuller997@testlogin.com
    ...    password=Test123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    

    Submit login form           ${user}
    User should be logged in    ${user}[name]

Nao deve logar com senha invalida
    
    ${user}    Create Dictionary
    ...    name=Wrong Login
    ...    email=wronglogin@testlogin.com
    ...    password=Test123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Set To Dictionary    ${user}    password=Wrong123

    Submit login form       ${user}
    Notice should be        Ocorreu um erro ao fazer login, verifique suas credenciais.