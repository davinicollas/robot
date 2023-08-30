*** Settings ***
Library        SeleniumLibrary
Resource       setup_teardown.robot
Test Setup     Dado que eu acesse o organo
Test Teardown  Fechar o browser    
Library    XML


*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]


*** Test Cases ***
Verificar se ao preencher os campos do formularios corretamente os dados são inseridos na lista e se um novo car e criad no time esperado
    E Preencha os campos do formularios
    E clique no botão criar card
    Então identificar o card do time esperado
*** Keywords ***
E Preencha os campos do formularios
    Input Text    ${CAMPO_NOME}     davi nicollas
    Input Text   ${CAMPO_CARGO}     ti
    Input Text   ${CAMPO_IMAGEM}    https://picsum.photos/200/300
    Click Element    ${CAMPO_TIME}   
    Click Element   ${OPCAO_PROGRAMACAO} 
E clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então identificar o card do time esperado
    Element Should Be Visible  class:colaborador



