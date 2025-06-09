*** Settings ***
Documentation    Cenarios de testes de atualização de tarefa

Resource    ../../resources/base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder marcar uma tarefa como finalizada

    ${data}    Get fixture    tasks    done

    Reset user from database         ${data}[user]

    Create a new task from API       ${data}

    Do login                         ${data}[user]

    Mark task as done                ${data}[task][name]
    Task should be done              ${data}[task][name]