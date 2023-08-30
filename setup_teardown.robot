*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Dado que eu acesse o organo
    Open Browser  url= http://localhost:3000   browser=Chrome

Fechar o browser    
    Close Browser
