
*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://serverest.dev

*** Test Cases ***
Listar produtos
    Create Session    minha_sessao    ${URL}

    ${RESPOSTA}=    GET On Session
    ...    minha_sessao
    ...    /produtos

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200
