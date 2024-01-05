const cooperativas = [
    {nome: 'EnerBásico', valorMinimoMensal: '0.00', valorMaximoMensal: '1500.00', desconto: '0.10'},
    {nome: 'EnerPopular', valorMinimoMensal: '0.00', valorMaximoMensal: '2500.00', desconto: '0.15'},
    {nome: 'EnerFácil', valorMinimoMensal: '1000.00', valorMaximoMensal: '40000.00', desconto: '0.18'},
    {nome: 'EnerPro', valorMinimoMensal: '2000.00', valorMaximoMensal: '10000.00', desconto: '0.20'},
    {nome: 'EnerLimpa', valorMinimoMensal: '10000.00', valorMaximoMensal: '80000.00', desconto: '0.25'},
    {nome: 'EnerGrande', valorMinimoMensal: '40000.00', valorMaximoMensal: '100000.00', desconto: '0.30'},
]


const barraValorConta = document.querySelector('.busca-economica__calc_valor');

barraValorConta.onkeyup = function formatarMoeda() {
    
    var valor = barraValorConta.value;

    valor = valor + '';
    valor = parseInt(valor.replace(/[\D]+/g, ''));
    valor = valor + '';
    valor = valor.replace(/([0-9]{2})$/g, ",$1");

    barraValorConta.value = valor;
    if(valor == 'NaN') barraValorConta.value = '';
}


const botaoBuscar = document.querySelector('.busca-economica__calc_botao-buscar')

const teste = document.querySelector('#form')

teste.addEventListener('submit', event => {
    event.preventDefault()

    const resultadoBuscaEconomica = document.querySelector('#resultado-busca__cooperativas');
    const resultadoCalcDescontoAnual = document.querySelector ('#resultado__calc_economia-anual');
    const resultadoCalcDescontoMensal = document.querySelector ('#resultado__calc_economia-mensal');
    const cooperativaElemento = document.querySelector('.cooperativa');
    const descontoElemento = document.querySelector('.desconto');
    const valorConta = parseFloat(document.querySelector('.busca-economica__calc_valor').value)
    const semBusca = document.querySelector('#resultado-busca__sem-busca')



if (!valorConta) {
}else {
    if (cooperativaElemento == null && descontoElemento == null){
       
        const cooperativaEconomica = cooperativas.filter(function(cooperativa) {
            return valorConta >= cooperativa.valorMinimoMensal && valorConta <= cooperativa.valorMaximoMensal
        });  
        
            cooperativaEconomica.forEach(i =>{
                let caixaCooperativa = document.createElement ('div')
                caixaCooperativa.setAttribute ('class', 'caixa_cooperativas')

                let seletorCooperativa = document.createElement ('input')
                seletorCooperativa.setAttribute ('type', 'radio')
                seletorCooperativa.setAttribute ('value', i.desconto)
                seletorCooperativa.setAttribute ('id', i.nome)
                seletorCooperativa.setAttribute ('name', 'cooperativas')
                seletorCooperativa.setAttribute ('class', 'cooperativaDesconto')

                let cooperativa = document.createElement ('label')
                cooperativa.setAttribute ('class', 'cooperativa')
                cooperativa.setAttribute ('for', i.nome)
                cooperativa.innerHTML = i.nome

                let quebra = document.createElement ('br')

                let desconto = document.createElement ('label')
                desconto.setAttribute ('class', 'desconto')
                desconto.setAttribute ('for', i.nome)
                desconto.innerHTML = i.desconto[2] + i.desconto[3] + "%" + " de desconto"

                resultadoBuscaEconomica.appendChild (caixaCooperativa)
                caixaCooperativa.appendChild(seletorCooperativa)
                caixaCooperativa.appendChild(cooperativa)
                caixaCooperativa.appendChild(quebra)
                caixaCooperativa.appendChild(desconto)

        })

        botaoBuscar.innerHTML = "Limpar busca"
        botaoCalculo.innerHTML = "Calcular economia"

        semBusca.setAttribute ('style', 'display: none')

    }else {

        const semBusca = document.querySelector('#resultado-busca__sem-busca')
        resultadoBuscaEconomica.innerHTML = ""
        resultadoCalcDescontoAnual.innerHTML = "R$0,00"
        resultadoCalcDescontoMensal.innerHTML = "Em médio R$ 0,00 por mês*"

        botaoBuscar.innerHTML = "Buscar ofertas!"
        botaoCalculo.innerHTML = "Calcular economia"

        semBusca.setAttribute  ('style', 'display: block')

    }
    
}
})

const botaoCalculo = document.querySelector('.resultado-busca__botao-calc-economia')

botaoCalculo.onclick = function calcularEconomia (){

    const resultadoCalcDescontoAnual = document.querySelector ('#resultado__calc_economia-anual');
    const resultadoCalcDescontoMensal = document.querySelector ('#resultado__calc_economia-mensal')


    if (resultadoCalcDescontoAnual.innerHTML == "R$0,00" && resultadoCalcDescontoMensal.innerHTML == "Em médio R$ 0,00 por mês*"){


        const valorDesconto = document.querySelector('input[name="cooperativas"]:checked').value;
        const valorConta = document.querySelector('.busca-economica__calc_valor').value;
    
    
        valor = parseFloat (valorConta.replace (",", "."));
    
        let calcAnualDesconto = parseFloat([valor * 12] * valorDesconto);
        let calcMensalDesconto = parseFloat(valor * valorDesconto);
    
        const descontoAnual = calcAnualDesconto.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
        const descontoMensal = calcMensalDesconto.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })

        resultadoCalcDescontoAnual.innerHTML = descontoAnual;
        resultadoCalcDescontoMensal.innerHTML = "Em média " + descontoMensal + " por mês*";

        botaoCalculo.innerHTML = "Limpar cálculo"

        console.log (valorDesconto)
    }else{

        resultadoCalcDescontoAnual.innerHTML = "R$0,00"
        resultadoCalcDescontoMensal.innerHTML = "Em médio R$ 0,00 por mês*"

        botaoCalculo.innerHTML = "Calcular economia"

    }
}

const modalParabens = () => {
    const modal = document.querySelector('.cantratar-cooperativa_modal')
    const actualStyle = modal.style.display
    if(actualStyle == 'block') {
      modal.style.display = 'none'
    }
    else {
      modal.style.display = 'block'
    }
  }
  
  const btn = document.querySelector('.cantratar-cooperativa__botao-contratar')
  btn.addEventListener('click', modalParabens)
  
  window.onclick = function(event) {
      const modal = document.querySelector('.cantratar-cooperativa_modal')
    if (event.target == modal) {
        modalParabens()
    }
  }












