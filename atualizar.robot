
*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}    https://serverest.dev
${ID}     COLE_SEU_ID_AQUI

*** Test Cases ***
Atualizar nome do usuario
    Create Session    minha_sessao    ${URL}

    &{dados_usuario}=    Create Dictionary
    ...    nome=Goku SSJ
    ...    email=gokuvigia114@qa.com.br
    ...    password=teste
    ...    administrador=true

    ${resposta}=    PUT On Session
    ...    minha_sessao
    ...    /usuarios/pGi6YkOR0PRvKnBk
    ...    json=${dados_usuario}

    Log To Console    ${resposta.text}

    Should Be Equal As Integers    ${resposta.status_code}    200
