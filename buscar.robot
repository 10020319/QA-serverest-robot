
*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://serverest.dev

*** Test Cases ***
Buscar usuario por ID
    Create Session    minha_sessao    ${URL}

    ${resposta}=    GET On Session
    ...    minha_sessao
    ...    /usuarios/nXGqpbIMW7oO3bQJ

    Log To Console    ${resposta.text}

    Should Be Equal As Integers    ${resposta.status_code}    200
