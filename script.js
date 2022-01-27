const form = document.querySelector(".form-pesquisa");
const valor = document.querySelector(".input-valor");
const btn = document.querySelector(".button-submit");
const tipo = document.querySelector("#tipo-pessoa")
const pesquisa = document.querySelector(".resultado");
const dados = [
    {
        "nome": "Enerfacil",
        "valorMinimoMensal": 1000,
        "valorMaximoMensall": 40000,
        "desconto": "0.2",
        "tipo_pessoa": "juridica"
    },
    {
        "nome": "Enerlimpa",
        "valorMinimoMensal": 0,
        "valorMaximoMensall": 20000,
        "desconto": "0.15",
        "tipo_pessoa": "juridica"
    },
    {
        "nome": "Cememp",
        "valorMinimoMensal": 10000,
        "valorMaximoMensall": 100000,
        "desconto": "0.21",
        "tipo_pessoa": "fisica"
    },
    {
        "nome": "Ibmea",
        "valorMinimoMensal": 5000,
        "valorMaximoMensall": 15000,
        "desconto": "0.17",
        "tipo_pessoa": "juridica"
    },
    {
        "nome": "EnerGrande",
        "valorMinimoMensal": 1000000,
        "valorMaximoMensall": 5000000,
        "desconto": "0.35",
        "tipo_pessoa": "fisica"
    },
    {
        "nome": "Lincur",
        "valorMinimoMensal": 600,
        "valorMaximoMensall": 2000,
        "desconto": "0.19",
        "tipo_pessoa": "juridica"
    },
    {
        "nome": "Evacour",
        "valorMinimoMensal": 5000,
        "valorMaximoMensall": 60000,
        "desconto": "0.25",
        "tipo_pessoa": "fisica"
    },
    {
        "nome": "ItaEnergia",
        "valorMinimoMensal": 7000,
        "valorMaximoMensall": 90000,
        "desconto": "0.26",
        "tipo_pessoa": "juridica"
    },
    {
        "nome": "EnerPlus",
        "valorMinimoMensal": 100000,
        "valorMaximoMensall": 200000,
        "desconto": "0.3",
        "tipo_pessoa": "fisica"
    },
    {
        "nome": "FisEnergy",
        "valorMinimoMensal": 100,
        "valorMaximoMensall": 700,
        "desconto": "0.05",
        "tipo_pessoa": "fisica"
    },
    {
        "nome": "ValPlus",
        "valorMinimoMensal": 10000,
        "valorMaximoMensall": 200000,
        "desconto": "0.3",
        "tipo_pessoa": "juridica"
    }
]

function ordenaPorDesconto(a,b){
    if(a.desconto > b.desconto) return -1;
    if(a.desconto < b.desconto) return 1;
    return 0;
}

btn.addEventListener('click',()=>{
    console.log(valor.value);
    const resultado = dados.filter((dado) => {
        return tipo.value === dado.tipo_pessoa && valor.value >= dado.valorMinimoMensal && valor.value <= dado.valorMaximoMensall;
    })
    resultado.sort(ordenaPorDesconto);
    pesquisa.innerHTML = `
        <div class="container-respostas">
        <h2>${resultado.length} ofertas encontradas!</h2>
        <div class="opcoes">
        ${resultado.map((dado)=>(
            `
                <div class="opcao">
                    <h3>Cooperativa: ${dado.nome}</h3>
                    <h5>Economia: ${dado.desconto * 100}%</h5>
                    <h5>Valor a pagar(com desconto): R$ ${valor.value * (1-dado.desconto)}
                    <h5>Valor do desconto: R$${valor.value * dado.desconto}</h5> 
                </div>
            `
        ))}
        </opcoes>
        </div>
    `
})

