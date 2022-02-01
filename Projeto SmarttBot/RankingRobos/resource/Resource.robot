*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}        https://app.smarttbot.com/public/login
${BROWSER}    chrome
${LOGIN}      id=login-username
${PASSWORD}   id=login-password
${BTN_LOGIN}  id=login-button
${BTN_CRIAR}  id=RunningInstances-create_instance_btn
${BTN_RANKING}  id=sidebar-menu-item-scoreboard

*** Keywords ***
#CENARIO 1
Abrir navegador
    Open Browser   ${URL}   ${BROWSER}

Fechar navegador
     Close Browser

Dado que estou na página inicial do site
    Title Should Be  SmarttBot 2.0 - Nossa tecnologia, suas ordens

Quando eu preencher o formulario de login com um login existente
    Input Text    ${LOGIN}    j.tito27@gmail.com
    Input Text    ${PASSWORD}    Maurialleli8

E clicar no botão acessar
    Click Element    ${BTN_LOGIN}

Então o sistema deve exibir a tela home
    Wait Until Element Is Visible  ${BTN_CRIAR}

E Validar se o menu Ranking está sendo exibido
    Wait Until Element Is Visible    ${BTN_RANKING}

#Cenario 2
Dado que estou logado página inicial do site
    Input Text    ${LOGIN}    j.tito27@gmail.com
    Input Text    ${PASSWORD}    Maurialleli8
    Click Element    ${BTN_LOGIN}
    Wait Until Element Is Visible  ${BTN_CRIAR}
    Page Should Contain    Análise geral

Quando eu clicar no menu Ranking
    Click Element    ${BTN_RANKING}
    Sleep    5
    Wait Until Page Contains    691 robôs encontrados

Então o sistema deve listar os robos existentes
    Page Should Contain  691 robôs encontrados

E validar a existencia do robo
    Page Should Contain  Heitor Villa-Lobos
