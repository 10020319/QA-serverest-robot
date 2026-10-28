
*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://serverest.dev

*** Test Cases ***
Cadastrar Usuario Goku
    ${body}=    Create Dictionary
    ...    nome=goku
    ...    email=gokuvigia114@qa.com.br
    ...    password=teste
    ...    administrador=true

    ${resposta}=    POST
    ...    ${BASE_URL}/usuarios
    ...    json=${body}
    ...    expected_status=201

    Should Be Equal As Integers    ${resposta.status_code}    201
    Should Be Equal    ${resposta.json()}[message]    Cadastro realizado com sucesso
    Log    ${resposta.json()}
