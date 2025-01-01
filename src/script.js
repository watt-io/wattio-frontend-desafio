const cooperatives = [
  {
    nome: "Enel",
    valorMinimoMensal: 1,
    valorMaximoMensal: 20000,
    desconto: 0.05,
    estado: "SP",
  },
  {
    nome: "EnerFácil",
    valorMinimoMensal: 1000,
    valorMaximoMensal: 40000,
    desconto: 0.2,
    estado: "MG",
  },
  {
    nome: "EnerLimpa",
    valorMinimoMensal: 10000,
    valorMaximoMensal: 80000,
    desconto: 0.25,
    estado: "Ambos",
  },
  {
    nome: "EnerGrande",
    valorMinimoMensal: 40000,
    valorMaximoMensal: 100000,
    desconto: 0.3,
    estado: "SP",
  },
];

document.getElementById("calculate-btn").addEventListener("click", () => {
  const energyBill = parseFloat(document.getElementById("energy-bill").value);
  const selectedEstado = document.getElementById("estado").value;
  const offersContainer = document.getElementById("offers-container");
  const offersSection = document.getElementById("offers-section");

  offersContainer.innerHTML = "";

  if (isNaN(energyBill) || energyBill <= 0) {
    alert("Por favor, insira um valor acima de 0.");
    return;
  }

  const availableCooperatives = cooperatives.filter(
    (coop) =>
      energyBill >= coop.valorMinimoMensal &&
      energyBill <= coop.valorMaximoMensal &&
      (coop.estado === selectedEstado || coop.estado === "Ambos")
  );

  if (availableCooperatives.length === 0) {
    offersContainer.innerHTML =
      "<p>Nenhuma oferta disponível para este valor e estado selecionados.</p>";
  } else {
    availableCooperatives.forEach((coop) => {
      const economia = energyBill * coop.desconto;
      const anual = economia * 12;
      const oferta = document.createElement("div");
      oferta.classList.add("offer");
      oferta.innerHTML = `
          <h3>${coop.nome}</h3>
          <p>Desconto: ${(coop.desconto * 100).toFixed(0)}%</p>
          <p>Economia: R$ ${economia.toFixed(2)} mensais</p>
          <p>Economia: R$ ${anual.toFixed(2)} anual</p>
          <button>Selecionar</button>
        `;
      offersContainer.appendChild(oferta);
    });
  }

  offersSection.classList.remove("hidden");
});

document.getElementById("open-modal-btn").addEventListener("click", () => {
  document.getElementById("add-cooperative-modal").style.display = "block";
});

document.getElementById("add-cooperative-btn").addEventListener("click", () => {
  const nome = document.getElementById("nome").value;
  const valorMinimoMensal = parseFloat(
    document.getElementById("valorMinimoMensal").value
  );
  const valorMaximoMensal = parseFloat(
    document.getElementById("valorMaximoMensal").value
  );
  const desconto = parseFloat(document.getElementById("desconto").value) / 100;
  const estado = document.getElementById("estadoEmpresa").value;

  if (
    !nome ||
    isNaN(valorMinimoMensal) ||
    isNaN(valorMaximoMensal) ||
    isNaN(desconto) ||
    valorMinimoMensal <= 0 ||
    valorMaximoMensal <= valorMinimoMensal ||
    desconto <= 0
  ) {
    alert("Por favor, preencha os campos corretamente.");
    return;
  }

  cooperatives.push({
    nome,
    valorMinimoMensal,
    valorMaximoMensal,
    desconto,
    estado,
  });

  alert(`Empresa "${nome}" adicionada com sucesso!`);

  document.getElementById("add-cooperative-form").reset();

  document.getElementById("add-cooperative-modal").style.display = "none";
});


window.addEventListener("click", (event) => {
  if (event.target === document.getElementById("add-cooperative-modal")) {
    document.getElementById("add-cooperative-modal").style.display = "none";
  }
});
