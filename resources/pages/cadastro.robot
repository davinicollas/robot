*** Settings ***
Resource     ../main.robot


*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{selecionar_times}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')] 
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação e Gestão')]


*** Keywords ***
E Preencha os campos do formularios
    ${Nome}  FakerLibrary.First Name
    Input Text    ${CAMPO_NOME}     ${Nome}
    ${Job}  FakerLibrary.Job
    Input Text   ${CAMPO_CARGO}     ${Job}
    ${Url}  FakerLibrary.Image Url    width=100     height=100
    Input Text   ${CAMPO_IMAGEM}    ${Url}
    Click Element    ${CAMPO_TIME}   
    Click Element   ${selecionar_times}[0]
E clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então identificar o card do time esperado
    Element Should Be Visible  class:colaborador


Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1   3      
    E Preencha os campos do formularios
    E clique no botão criar card
    END

Entao criar e identificar 1 card em cada time disponivel
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        E Preencha os campos do formularios
        Click Element    ${time}
        E clique no botão criar card
        Sleep    10s         
    END


Dado que eu clique no botao criar card

    Click Element    ${BOTAO_CARD}

Então o sidetema identificar os campos obrigatorio

    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro

