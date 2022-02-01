*** Settings ***
Resource          ../resource/Resource.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Case ***

Cenário 01: Validar Login
    Dado que estou na página inicial do site
    Quando eu preencher o formulario de login com um login existente
    E clicar no botão acessar
    Então o sistema deve exibir a tela home
    E Validar se o menu Ranking está sendo exibido

Cenário 02: Validar exibição do robô ​Heitor Villa-Lobos
    Dado que estou logado página inicial do site
    Quando eu clicar no menu Ranking
    Então o sistema deve listar os robos existentes
    E validar a existencia do robo
