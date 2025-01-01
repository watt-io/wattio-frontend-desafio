const cooperativas = [
  { nome: "EnerFácil", desconto: 0.18, contrato: "PJ e PF", min: 1000, max: 40000 },
  { nome: "EnerPopular", desconto: 0.15, contrato: "PF", min: 10000, max: 80000 },
  { nome: "EnerPro", desconto: 0.2, contrato: "PJ", min: 40000, max: 150000 },
];

function formatarMoeda(campo) {
  let valor = campo.value.replace(/\D/g, "");
  valor = (valor / 100).toFixed(2).replace(".", ",");
  campo.value = "R$ " + valor;
}

function consultarOfertas() {
  const valorInput = parseFloat(document.getElementById("valorConta").value.replace("R$ ", "").replace(/\./g, "").replace(",", "."));
  const cardsContainer = document.getElementById("cards");
  const ofertasContainer = document.getElementById("ofertas");
  const economiaSection = document.getElementById("economia");

  economiaSection.style.display = "none"; // Esconde a seção de economia

  cooperativas.forEach(coop => {
    // Verifica se o cartão da cooperativa já foi criado
    const ofertaJaExiste = Array.from(cardsContainer.children).some(card =>
      card.querySelector("h3").textContent === coop.nome
    );

    if (!ofertaJaExiste && valorInput >= coop.min && valorInput <= coop.max) {
      const card = document.createElement("div");
      card.className = "card";
      card.innerHTML = `
        <h3>${coop.nome}</h3>
        <p>Economia: ${(coop.desconto * 100).toFixed(0)}%</p>
        <p>Contrato: ${coop.contrato}</p>
      `;
      card.onclick = () => selecionarCooperativa(coop, valorInput);
      cardsContainer.appendChild(card);
    }
  });

  // Mostra a seção de ofertas apenas se houver pelo menos uma oferta
  if (cardsContainer.childElementCount > 0) {
    ofertasContainer.style.display = "block";
  } else {
    ofertasContainer.style.display = "none";
  }
}

function selecionarCooperativa(coop, valorInput) {
  const cards = document.querySelectorAll(".card");
  cards.forEach(card => card.classList.remove("selecionada"));

  const economiaAnual = (valorInput * coop.desconto) * 12;
  const economiaMensal = economiaAnual / 12;

  document.querySelectorAll(".card").forEach(card => {
    if (card.querySelector("h3").textContent === coop.nome) {
      card.classList.add("selecionada");
    }
  });

  const economiaSection = document.getElementById("economia");
  const valorEconomia = document.getElementById("valorEconomia");

  valorEconomia.innerHTML = `
  <strong class="economiaAnual">R$ ${economiaAnual.toLocaleString("pt-BR", { minimumFractionDigits: 2 })}</strong>
  <br>Em média <strong class="economiaMensal">R$ ${economiaMensal.toLocaleString("pt-BR", { minimumFractionDigits: 2 })}</strong> por mês
`;

  economiaSection.style.display = "block";
}

function atualizarCampoSliderDinamico() {
  const slider = document.getElementById("sliderValor");
  const valorSlider = document.getElementById("valorSlider");
  const valorConta = document.getElementById("valorConta");

  // Formata o valor do slider com estilo de moeda BRL e duas casas decimais
  const valorFormatado = parseFloat(slider.value).toLocaleString("pt-BR", {
    style: "currency",
    currency: "BRL",
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  });

  // Atualiza o valor exibido no campo e no slider
  valorSlider.innerText = valorFormatado;
  valorConta.value = valorFormatado;

  // Atualiza as ofertas automaticamente com o valor ajustado
  atualizarOfertasDinamicas(parseFloat(slider.value));
}

function atualizarOfertasDinamicas(valorInput) {
  const cardsContainer = document.getElementById("cards");
  const ofertasContainer = document.getElementById("ofertas");
  const economiaSection = document.getElementById("economia");

  cardsContainer.innerHTML = ""; // Limpa os cartões
  economiaSection.style.display = "none"; // Esconde a seção de economia

  // Atualiza as ofertas com base no valor
  cooperativas.forEach(coop => {
    if (valorInput >= coop.min && valorInput <= coop.max) {
      const card = document.createElement("div");
      card.className = "card";
      card.innerHTML = `
      <h3>${coop.nome}</h3>
      <p>Economia: ${(coop.desconto * 100).toFixed(0)}%</p>
      <p>Contrato: ${coop.contrato}</p>
    `;
      card.onclick = () => selecionarCooperativa(coop, valorInput);
      cardsContainer.appendChild(card);
    }
  });

  // Exibe as ofertas automaticamente se houver pelo menos uma
  if (cardsContainer.childElementCount > 0) {
    ofertasContainer.style.display = "block";
  } else {
    ofertasContainer.style.display = "none";
  }
}
// Função para abrir o modal
function abrirModal(nomeCoop) {
  const modal = document.getElementById("modal");
  const nomeCooperativa = document.getElementById("nomeCooperativa");
  nomeCooperativa.textContent = nomeCoop; // Atualiza o nome da cooperativa
  modal.style.display = "flex"; // Exibe o modal

  // Adiciona o evento para fechar com ESC
  document.addEventListener("keydown", fecharModalESC);
}

// Função para fechar o modal
function fecharModal() {
  const modal = document.getElementById("modal");
  modal.style.display = "none"; // Esconde o modal

  // Remove o evento de fechar com ESC
  document.removeEventListener("keydown", fecharModalESC);
}

// Função para fechar o modal ao pressionar ESC
function fecharModalESC(event) {
  if (event.key === "Escape") {
    fecharModal();
  }
}

// Adiciona evento ao botão "Fechar"
document.getElementById("fecharModal").addEventListener("click", fecharModal);

// Modifica o botão "Contratar" para abrir o modal
document.getElementById("contratar").addEventListener("click", () => {
  const nomeCoop = document.querySelector(".card.selecionada h3").textContent; // Pega o nome da cooperativa selecionada
  abrirModal(nomeCoop);
});


