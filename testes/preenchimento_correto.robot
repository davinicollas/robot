*** Settings ***

Resource       ../resources/main.robot
Test Setup     Dado que eu acesse o organo
Test Teardown  Fechar o browser    
Library    XML


*** Test Cases ***
Verificar se ao preencher os campos do formularios corretamente os dados são inseridos na lista e se um novo car e criad no time esperado
    E Preencha os campos do formularios
    E clique no botão criar card
    Então identificar o card do time esperado

Verificar se é possivel criar mais de um card se preenchermos os campos corretamente
    E Preencha os campos do formularios
    E clique no botão criar card
    Então identificar 3 cards no time esperado

Verificar se e possivel criar um card time disponivel se preenchermos os campos corretamentes
    E Preencha os campos do formularios
    Entao criar e identificar 1 card em cada time disponivel
    Então identificar 3 cards no time esperado

