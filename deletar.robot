
*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://serverest.dev
${ID}     pGi6YkOR0PRvKnBk

*** Test Cases ***
Deletar usuario
    Create Session    minha_sessao    ${URL}

    ${resposta}=    DELETE On Session
    ...    minha_sessao
    ...    /usuarios/J6N6IxBB6sBscIe1

    Log To Console    ${resposta.text}

    Should Be Equal As Integers    ${resposta.status_code}    200
