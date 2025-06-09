*** Settings ***
Documentation    Cenarios de testes de remoção de tarefa

Resource    ../../resources/base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder apagar uma tarefa

    ${data}    Get fixture    tasks    delete

    Reset user from database         ${data}[user]

    Create a new task from API       ${data}

    Do login                         ${data}[user]

    Delete a task                    ${data}[task][name]
    Task should not exist            ${data}[task][name] 