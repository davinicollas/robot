*** Settings ***
Library         SeleniumLibrary
Resource        setup_teardown.robot
Task Setup      Dado que eu acesse o organo
Test Teardown   Fechar o browser


*** Variables ***
${BOTAO_CARD}             id:form-botao


*** Test Cases ***
Verificar se quando um campo obrigatorio não for preenchido corretamente
    Dado que eu clique no botao criar card
    Então o sidetema identificar os campos obrigatorio
    

*** Keywords ***
Dado que eu clique no botao criar card

    Click Element    ${BOTAO_CARD}

Então o sidetema identificar os campos obrigatorio

    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro

