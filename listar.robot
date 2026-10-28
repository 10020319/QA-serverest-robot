

*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://serverest.dev

*** Test Cases ***
Listar usuarios
    Create Session    minha_sessao    ${URL}

    ${resposta}=    GET On Session
    ...    minha_sessao
    ...    /usuarios

    Log To Console    ${resposta.text}

    Should Be Equal As Integers    ${resposta.status_code}    200
