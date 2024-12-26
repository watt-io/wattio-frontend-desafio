const ofertas = [
  {
    nome: "EnerFácil",
    valorMinimoMensal: 1000,
    valorMaximoMensal: 40000,
    desconto: 0.2,
  },
  {
    nome: "EnerLimpa",
    valorMinimoMensal: 10000,
    valorMaximoMensal: 80000,
    desconto: 0.25,
  },
  {
    nome: "EnerGrande",
    valorMinimoMensal: 1000,
    valorMaximoMensal: 40000,
    desconto: 0.2,
  },
];

const mostrarOfertasBtn = document.getElementById("mostrarOfertasBtn");
const opcoesOfertas = document.getElementById("opcoesOfertas");
const ofertasForm = document.getElementById("ofertasForm");
const contratarBtn = document.getElementById("contratarBtn");
const valorContaInput = document.getElementById("valorConta");

mostrarOfertasBtn.addEventListener("click", () => {
  const valorConta = parseFloat(valorContaInput.value);

  if (isNaN(valorConta) || valorConta <= 0) {
    alert("Por Favor, insira um valor válido!");
    return;
  }

  const ofertasFiltradas = ofertas.filter(
    (oferta) =>
      valorConta >= oferta.valorMinimoMensal &&
      valorConta <= oferta.valorMaximoMensal
  );

  ofertasForm.innerHTML = "";

  if (ofertasFiltradas.length === 0) {
    ofertasForm.innerHTML =
      "<p>Nenhuma oferta disponível para o valor informado.</p>";
    contratarBtn.style.display = "none";
  } else {
    ofertasFiltradas.forEach((oferta, index) => {
      const economia = valorConta * oferta.desconto;

      const ofertaElement = `    
            <label>      
            <div class="oferta">
            <input type="radio" name="oferta" value="${index}" />
                <h3>${oferta.nome}</h3>
                <p>Valor da conta: <span style="color: #ecc030">R$ ${valorConta.toFixed(
                  2
                )}</span></p>
                <p>Desconto: <span style="color: #ecc030">R$ ${
                  oferta.desconto * 100
                }%</span></p>
                <p>Valor da conta: <span style="color: #ecc030">R$ ${economia.toFixed(
                  2
                )}</span></p>
            </div>
            </label>
        `;
      ofertasForm.insertAdjacentHTML("beforeend", ofertaElement);
    });

    contratarBtn.style.display = "block";
  }

  opcoesOfertas.style.display = "block";
});

contratarBtn.addEventListener("click", () => {
  const ofertaSelecionada = document.querySelector(
    'input[name="oferta"]:checked'
  );

  if (!ofertaSelecionada) {
    alert("Por favor, selecione uma oferta antes de contratar.");
    return;
  }

  const ofertaIndex = parseInt(ofertaSelecionada.value);
  const ofertaEscolhida = ofertas[ofertaIndex];

  alert(`Você contratou: ${ofertaEscolhida.nome}`);
});
