const cooperatives = [
  {
    nome: 'EnerFácil',
    valorMinimoMensal: 1000,
    valorMaximoMensal: 40000,
    desconto: 0.2,
    tipoCliente: 'Pessoa Física ou Jurídica',
  },
  {
    nome: 'EnerLimpa',
    valorMinimoMensal: 10000,
    valorMaximoMensal: 80000,
    desconto: 0.25,
    tipoCliente: 'Pessoa Jurídica',
  },
  {
    nome: 'EnerGrande',
    valorMinimoMensal: 40000,
    valorMaximoMensal: 100000,
    desconto: 0.3,
    tipoCliente: 'Pessoa Jurídica',
  },
  {
    nome: 'EnerSolar',
    valorMinimoMensal: 2000,
    valorMaximoMensal: 50000,
    desconto: 0.15,
    tipoCliente: 'Pessoa Física',
  },
];

function calculateOffers() {
  const energyCost = parseFloat(document.getElementById('energyCost').value);
  const offersList = document.getElementById('offersList');
  offersList.innerHTML = '';

  document.getElementById('successMessage').style.display = 'none'; //escondo mensagem

  if (isNaN(energyCost) || energyCost < 1000) {
    alert('Por favor, insira um valor válido (mínimo de R$ 1.000,00).');
    return;
  }
  

  const validOffers = cooperatives.filter(coop =>
    energyCost >= coop.valorMinimoMensal && energyCost <= coop.valorMaximoMensal
  );

  if (validOffers.length === 0) {
    offersList.innerHTML = '<p>Nenhuma oferta disponível para este valor.</p>';
  } else {
    validOffers.forEach((offer, index) => {
      const offerElement = document.createElement('div');
      offerElement.classList.add('offer');

      offerElement.innerHTML = `
        <strong>${offer.nome}</strong><br>
        Economia de ${offer.desconto * 100}%<br>
        Tipo: ${offer.tipoCliente}
      `;
      offerElement.dataset.discount = offer.desconto;

      offerElement.addEventListener('click', () => selectOffer(offerElement));
      offersList.appendChild(offerElement);
    });
  }

  document.getElementById('offers').style.display = 'block';
  document.getElementById('economy').style.display = 'none';
}

function selectOffer(offerElement) {
  const allOffers = document.querySelectorAll('#offersList .offer');
  allOffers.forEach(offer => offer.classList.remove('selected'));
  offerElement.classList.add('selected');
}

function calculateEconomy() {
  const energyCost = parseFloat(document.getElementById('energyCost').value);
  const selectedOffer = document.querySelector('#offersList .offer.selected');

  if (!selectedOffer) {
    alert('Selecione uma oferta para calcular a economia.');
    return;
  }

  const discount = parseFloat(selectedOffer.dataset.discount);
  const annualEconomy = energyCost * discount * 12;
  const monthlyEconomy = energyCost * discount;

  document.getElementById('annualEconomy').innerText = `R$ ${annualEconomy.toFixed(2)}`;
  document.getElementById('monthlyEconomy').innerText = `R$ ${monthlyEconomy.toFixed(2)}`;

  document.getElementById('economy').style.display = 'block';
}

function hireOffer() {
  const successMessage = document.getElementById('successMessage');
  successMessage.style.display = 'block';
}

function syncInputs() {
  const slider = document.getElementById('energySlider');
  const input = document.getElementById('energyCost');
  input.value = slider.value;
}

document.getElementById('energyCost').addEventListener('input', function () {
  const slider = document.getElementById('energySlider');
  slider.value = this.value;
});
