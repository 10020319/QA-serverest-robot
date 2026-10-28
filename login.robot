*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://serverest.dev

*** Test Cases ***
Login com sucesso
    Create Session    minha_sessao    ${URL}

    &{dados_login}=    Create Dictionary
    ...    email=gokuvigia114@qa.com.br
    ...    password=teste

    ${resposta}=    POST On Session
    ...    minha_sessao
    ...    /login
    ...    json=${dados_login}

    Should Be Equal As Integers    ${resposta.status_code}    200