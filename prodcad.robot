
*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}       https://serverest.dev
${TOKEN}     eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imdva3V2aWdpYTExNEBxYS5jb20uYnIiLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNzkzMjIxOTM3LCJleHAiOjE3OTMyMjI1Mzd9.Q3sOWGU9K-W-Ze1446t1BbB9KaKBW8m9q-S-8AsRegc

*** Test Cases ***
Cadastrar produto
    Create Session    minha_sessao    ${URL}

    ${HEADERS}=    Create Dictionary
    ...    Authorization=Bearer ${TOKEN}

    ${BODY}=    Create Dictionary
    ...    nome=bola
    ...    preco=479
    ...    descricao=futebol
    ...    quantidade=78

    ${RESPOSTA}=    POST On Session
    ...    minha_sessao
    ...    /produtos
    ...    json=${BODY}
    ...    headers=${HEADERS}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    201

