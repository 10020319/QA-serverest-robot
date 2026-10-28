
*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***
${URL}    https://serverest.dev

*** Test Cases ***

1 - Cadastrar usuario
    Create Session    api    ${URL}

    ${ALEATORIO}=    Generate Random String    8    [LETTERS]
    ${EMAIL}=    Set Variable    goku${ALEATORIO}@qa.com.br
    Set Suite Variable    ${EMAIL}

    ${BODY}=    Create Dictionary
    ...    nome=GokuSuite
    ...    email=${EMAIL}
    ...    password=teste
    ...    administrador=true

    ${RESPOSTA}=    POST On Session
    ...    api    /usuarios    json=${BODY}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    201

    ${DADOS}=    Call Method    ${RESPOSTA}    json
    ${ID_USUARIO}=    Get From Dictionary    ${DADOS}    _id
    Set Suite Variable    ${ID_USUARIO}


2 - Fazer login
    ${BODY}=    Create Dictionary
    ...    email=${EMAIL}
    ...    password=teste

    ${RESPOSTA}=    POST On Session
    ...    api    /login    json=${BODY}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200

    ${DADOS}=    Call Method    ${RESPOSTA}    json
    ${TOKEN}=    Get From Dictionary    ${DADOS}    authorization
    Set Suite Variable    ${TOKEN}


3 - Listar usuarios
    ${RESPOSTA}=    GET On Session    api    /usuarios

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200


4 - Buscar usuario por ID
    ${RESPOSTA}=    GET On Session
    ...    api    /usuarios/${ID_USUARIO}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200


5 - Atualizar usuario
    ${BODY}=    Create Dictionary
    ...    nome=GokuSSJ
    ...    email=${EMAIL}
    ...    password=teste
    ...    administrador=true

    ${RESPOSTA}=    PUT On Session
    ...    api    /usuarios/${ID_USUARIO}    json=${BODY}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200


6 - Cadastrar produto
    ${ALEATORIO}=    Generate Random String    8    [LETTERS]
    ${NOME_PRODUTO}=    Set Variable    bola${ALEATORIO}
    Set Suite Variable    ${NOME_PRODUTO}

    ${HEADERS}=    Create Dictionary
    ...    Authorization=${TOKEN}

    ${BODY}=    Create Dictionary
    ...    nome=${NOME_PRODUTO}
    ...    preco=479
    ...    descricao=futebol
    ...    quantidade=78

    ${RESPOSTA}=    POST On Session
    ...    api    /produtos
    ...    json=${BODY}
    ...    headers=${HEADERS}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    201

    ${DADOS}=    Call Method    ${RESPOSTA}    json
    ${ID_PRODUTO}=    Get From Dictionary    ${DADOS}    _id
    Set Suite Variable    ${ID_PRODUTO}


7 - Listar produtos
    ${RESPOSTA}=    GET On Session    api    /produtos

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200


8 - Buscar produto por ID
    ${RESPOSTA}=    GET On Session
    ...    api    /produtos/${ID_PRODUTO}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200


9 - Atualizar produto
    ${HEADERS}=    Create Dictionary
    ...    Authorization=${TOKEN}

    ${BODY}=    Create Dictionary
    ...    nome=${NOME_PRODUTO}
    ...    preco=500
    ...    descricao=futebol atualizado
    ...    quantidade=90

    ${RESPOSTA}=    PUT On Session
    ...    api    /produtos/${ID_PRODUTO}
    ...    json=${BODY}
    ...    headers=${HEADERS}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200


10 - Excluir produto
    ${HEADERS}=    Create Dictionary
    ...    Authorization=${TOKEN}

    ${RESPOSTA}=    DELETE On Session
    ...    api    /produtos/${ID_PRODUTO}
    ...    headers=${HEADERS}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200


11 - Excluir usuario
    ${RESPOSTA}=    DELETE On Session
    ...    api    /usuarios/${ID_USUARIO}

    Log To Console    ${RESPOSTA.text}
    Should Be Equal As Integers    ${RESPOSTA.status_code}    200



