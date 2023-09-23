*** Settings ***
Resource       ../resources/main.robot
Task Setup      Dado que eu acesse o organo
Test Teardown   Fechar o browser


*** Variables ***
${BOTAO_CARD}             id:form-botao


*** Test Cases ***
Verificar se quando um campo obrigatorio não for preenchido corretamente
    Dado que eu clique no botao criar card
    Então o sidetema identificar os campos obrigatorio
    
