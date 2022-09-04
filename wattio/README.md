# WATTio app

<p>O app foi feito usando somente as coisas nativas do flutter sem nenhum packge ou plugin, o projeto foi dividido entre mobile e web ambos com layouts diferentes eles consomem os dados do mesmo repository, o app conta com animações de transição de tela(somente mobile).</p>

# Estrutura do projeto
<p> essa é a estrutura do projeto:</p>

<img src="assets/readme/1.png">


### Vamos falar sobre cada diretorio e como tudo foi organizado
<ul>
<li>src</li>
    <p>Esse diretório é onde fica todo código, o único arquivo fora dele é o main.dart.</p>
<li>modules</li>
    <p>Aqui fica a divisão entre os layouts, entro de layout fica a divisão entre mobile e web.</p>
<li>mobile</li>
    <p>Aqui ficam cada tela do mobile separada por outros diretórios e cada um com seu controller ali dentro e um diretório de componentes para fazer toda componentização.</p>
<li>web</li>
    <p>Todo código de layout e controller do web ficam aqui exatamente como funciona no mobile.</p>
<li>shared</li>
    <p>Aqui fica todo código que não é acoplado a uma única tela, pode ser usado por qualquer modulo do código.</p>
<li>mock</li>
    <p>O mock contém uma classe com a api fake em formato de string para ser usada.</p>
<li>models</li>
    <p>Models serve para transformar os dados da api em um objeto dart para usá-lo com mais facilidade.</p>
<li>repository</li>
    <p>Os repositorys nessa estrutura são responsáveis por acessar qualquer coisa externa do app nesse caso consumir a api.</p>
<li>routes</li>
    <p>Aqui ficam todas as rotas nomeadas.</p>
<li>animations</li>
    <p>Nesse diretório fica o código de animação de transição de telas e por esse motivo ela está dentro de routes.</p>
<li>theme</li>
    <p>Aqui fica as classes de images de app e qualquer coisa relacionada a design.</p>
</ul>

## Mobile

<p> A versão mobile conta com esse design inspirado em um modelo feito no figma, só que com algumas mudanças de cor estilo fonte e outras coisas (O modelo figma não foi feito por mim).</p>

<a href="https://www.figma.com/file/oYLjPBSIiYS0UMSIOO04MH/wattIO?node-id=0%3A1"> <p>Modelo figma</p></a>


<img src="assets/readme/mobile1.jpg" alt="Mobile1" height="700" width="400">
<img src="assets/readme/mobile2.jpg" alt="Mobile2" height="700" width="400">
<img src="assets/readme/mobile3.jpg" alt="Mobile3" height="700" width="400">
<img src="assets/readme/mobile4.jpg" alt="Mobile4" height="700" width="400">
<img src="assets/readme/mobile5.jpg" alt="Mobile5" height="700" width="400">


<p>Na versão mobile existe um botão de menu onde lá é possível "desativar a internet" e ver como o app se comportaria caso essa conexão falhasse(Apenas no mobile).<p>



## Web

<p>A versão web o design foi construído de forma bem diferente com imagens de fundo e outra estrutura.</p>

<img src="assets/readme/web1.png">
<img src="assets/readme/web2.png">

<p>A versão web não conta com o recurso de "desativar a internet" pois essa ideia perde o sentido na web que já precisa de internet para acessar o site.</p>

## Testes

<p>Aqui temos o teste validando 2 casos, o caso de pegar os dados da api e o caso de falha de conexão, os testes aqui validam a lógica por traz dessa implementação, aqui é testado esses dois possíveis retorno do repository.</p>

<img src="assets/readme/testes.png">

<p>Aqui os testes mostram que está tudo funcionando como deveria.<p>

<p>A conclusão do desafio foi essa, espero feedback sobre o projeto :)<p>
