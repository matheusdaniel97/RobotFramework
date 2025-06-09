*** Settings ***
Documentation

Resource    ../resources/base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***

Deve poder cadastrar um novo usuario

    ${user}    Create Dictionary
    ...    name=Matheus Daniel
    ...    email=ganzenmuller1997@gmail.com
    ...    password=Test123

    Remove user from database    ${user}[email]

    Go to signup page
    Submit signup form    ${user}
    Notice should be    Boas vindas ao Mark85, o seu gerenciador de tarefas.
    

Nao deve permitir o cadastro com email duplicado
    [Tags]    dup    #Tag indicando cenário ou ciclo para execução de apenas determinados testes

    ${user}    Create Dictionary
    ...    name=Matheus D
    ...    email=ganzenmuller1997@test.com
    ...    password=Test123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}



    Go to signup page
    Submit signup form    ${user}
    Notice should be    Oops! Já existe uma conta com o e-mail informado.

Nao deve permitir cadastro com campos vazios
    [Tags]    required

    ${user}    Create Dictionary
    ...        name=${EMPTY}
    ...        email=${EMPTY}
    ...        password=${EMPTY}
    
    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe seu nome completo
    
    Alert should be    Informe seu e-email

    Alert should be    Informe uma senha com pelo menos 6 digitos

Nao deve cadastrar com email incorreto
    ${user}    Create Dictionary
    ...    name=Invalid Email
    ...    email=invalidmailtest.com
    ...    password=Test123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}



    Go to signup page
    Submit signup form    ${user}
    Alert should be    Digite um e-mail válido

Nao deve cadastrar com senha menor que 6 digitos
    [Tags]    short_pass

    @{password_list}    Create List    1    12    123    1234    12345

    FOR    ${password}    IN    @{password_list}
        ${user}    Create Dictionary
        ...        name=Matheus incorretoPass
        ...        email=matheus@testpass.com
        ...        password=${password}
    
    Go to signup page
    Submit signup form    ${user}
    Alert should be    Informe uma senha com pelo menos 6 digitos
        
    END
