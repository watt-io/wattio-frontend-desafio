let input_value = document.querySelector('.input_valor');
let input_range = document.querySelector('.input_range');
const btn_calcular = document.querySelector('.calcular_ofertas');
const ofertas_geral = document.querySelector('.ofertas_geral');
const resultado = document.querySelector('.resultado');
let pessoa_juridica = document.querySelector('.pessoa_juridica');
let pessoa_fisica = document.querySelector('.pessoa_fisica');
let paragraph_alert = document.createElement('p');

let valor_desconto = 0, valor_checado;

let valores_arr = [];

let ofertas, contador = 0, apagar = 0, btn_calcular_final, btn_calcular_final_grupo, btn_comprar_final, btn_comprar_final_grupo, select_option, counter = 0;

btn_calcular_final = document.createElement('button');


btn_comprar_final_grupo = document.createElement('div');
    btn_comprar_final_grupo.classList.add('calcular_grupo');
    btn_comprar_final = document.createElement('button');
    btn_comprar_final.classList.add('calcular_ofertas');

input_value.value = 1000;
input_value.value += ',00';

input_range.addEventListener('input', () => {
    input_value.value = input_range.value*1000;
    input_value.value += ',00';
    btn_calcular.disabled = false;
    btn_calcular.style.cursor = 'pointer';
    btn_calcular.style.backgroundColor = 'orangered';
    btn_calcular.style.color = 'black';
})

const cooperativasEnergia = [
    {
        nome: 'EnerFácil',
        valorMinimoMensal: 1000,
        valorMaximoMensal: 40000,
        desconto: 0.2,
        check: 0
    },
    {
        nome: 'EnerLimpa',
        valorMinimoMensal: 1000,
        valorMaximoMensal: 80000,
        desconto: 0.25,
        check: 0
    },
    {
        nome: 'EnerGrande',
        valorMinimoMensal: 40000,
        valorMaximoMensal: 100000,
        desconto: 0.3,
        check: 0
    },
    {
        nome: 'EnerRenovavel',
        valorMinimoMensal: 50000,
        valorMaximoMensal: 100000,
        desconto: 0.4,
        check: 0
    },
    {
        nome: 'EnerAmbiental',
        valorMinimoMensal: 55000,
        valorMaximoMensal: 100000,
        desconto: 0.5,
        check: 0
    },
    {
        nome: 'EnerHealth',
        valorMinimoMensal: 60000,
        valorMaximoMensal: 100000,
        desconto: 0.6,
        check: 0
    },
    {
        nome: 'EnerMini',
        valorMinimoMensal: 65000,
        valorMaximoMensal: 100000,
        desconto: 0.7,
        check: 0
    },
    {
        nome: 'EnerGenail',
        valorMinimoMensal: 70000,
        valorMaximoMensal: 100000,
        desconto: 0.8,
        check: 0
    },
    {
        nome: 'EnerGrowth',
        valorMinimoMensal: 75000,
        valorMaximoMensal: 100000,
        desconto: 0.85,
        check: 0
    },
    {
        nome: 'EnerSaude',
        valorMinimoMensal: 80000,
        valorMaximoMensal: 100000,
        desconto: 0.9,
        check: 0
    }
]


btn_calcular.addEventListener('click', () =>{    
    contador = 0;
    criar()
    btn_calcular.disabled = true;
    btn_calcular.style.cursor = 'not-allowed';
    btn_calcular.style.backgroundColor = 'gray';
    btn_calcular.style.color = 'white';
});



function criar()
{
    const myobg = document.querySelectorAll('.ofertas');
    for (let i of myobg) ofertas_geral.removeChild(i);
    console.log(myobg);
    for (let i of cooperativasEnergia)
    {
        if (parseInt(input_value.value) >= i.valorMinimoMensal)
        {
            valores_arr.push(i);
            contador++;
            ofertas = document.createElement('div');
            ofertas.classList.add('ofertas');
            ofertas_geral.appendChild(ofertas); 
            let div_ofertas = document.createElement('div');
            div_ofertas.classList.add('div_ofertas');
            ofertas.appendChild(div_ofertas);
            select_option = document.createElement('input');
            select_option.setAttribute('type', 'radio');
            select_option.setAttribute('name', 'ofertas_option');
            select_option.setAttribute('value', i.nome)
            select_option.classList.add('select_option')
            div_ofertas.appendChild(select_option);
            let label_option = document.createElement('label');
            label_option.innerHTML = `Oferta ${contador}`;
            div_ofertas.appendChild(label_option);
            ofertas.style.display = 'block';
            let paragraph_nome = document.createElement('p');
            paragraph_nome.innerHTML = `<b>Nome:</b>`;
            ofertas.appendChild(paragraph_nome);
            let paragraph_desconto = document.createElement('p');
            paragraph_desconto.innerHTML = `<b>Desconto:</b>`;
            ofertas.appendChild(paragraph_desconto);
            paragraph_nome.innerHTML += ` ${i.nome}`;
            paragraph_desconto.innerHTML += ` ${i.desconto*100}%`;
        }
    }
    btn_calcular_final_grupo = document.createElement('div');
    btn_calcular_final_grupo.classList.add('calcular_grupo');
    btn_calcular_final.classList.add('calcular_ofertas');
    btn_calcular_final_grupo.appendChild(btn_calcular_final);
    ofertas_geral.appendChild(btn_calcular_final_grupo);
    btn_calcular_final.innerHTML =  'Calcular economia';
    checked_arr = document.querySelectorAll('.select_option');
    btn_calcular_final.addEventListener('click', () => {
        let my_resultado = document.querySelectorAll('.div_resultado');
        for (let i of my_resultado) resultado.removeChild(i);
        for (let i of checked_arr) 
        {
            if (i.checked == true) 
            {
                for (let x of cooperativasEnergia)
                {
                    if (i.value == x.nome) 
                    {
                        valor_desconto = 12*parseInt(input_value.value) - 12*parseInt(input_value.value)*x.desconto;
                        if (pessoa_juridica.checked == true) valor_desconto*= 1.1;
                        if (pessoa_fisica.checked == true) valor_desconto*= 1.05;
                    }
                }
            }
        }
        let div_resultado = document.createElement('div');
        div_resultado.classList.add('div_resultado');
        let paragraph_resultado = document.createElement('p');
        paragraph_resultado.classList.add('paragraph_resultado');
        paragraph_resultado.innerHTML = 'Minha economia anual será de'
        div_resultado.appendChild(paragraph_resultado);
        let valor_resultado = document.createElement('h2');
        valor_resultado.classList.add('paragraph_resultado');
        valor_resultado.innerHTML = `R$ ${valor_desconto}`
        valor_resultado.innerHTML += ',00'
        div_resultado.appendChild(valor_resultado);
        resultado.appendChild(div_resultado);
        console.log(valor_checado);
        
        paragraph_alert.classList.add('paragraph_alert');
        paragraph_alert.innerHTML = '*Lembrando que isso é apenas uma simulação*';
        resultado.appendChild(paragraph_alert);
        btn_comprar_final_grupo.appendChild(btn_comprar_final);
        resultado.appendChild(btn_comprar_final_grupo);
        btn_comprar_final.innerHTML =  'Comprar';
        btn_comprar_final.classList.add('btn');
        btn_comprar_final.classList.add('btn-primary');
        btn_comprar_final.setAttribute('id', 'btn_comprar')
        btn_comprar_final.setAttribute('data-bs-toggle', 'modal');
        btn_comprar_final.setAttribute('data-bs-target', '#exampleModal');
    });
}