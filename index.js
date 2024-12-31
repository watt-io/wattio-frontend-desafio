function encontrarPlano(valor, tipoContrato) {
  const planosFiltrados = planos
    .filter((plano) => {
      const contratoValido =
        (tipoContrato === "PF" && plano.contratoPF) ||
        (tipoContrato === "PJ" && plano.contratoPJ);
      const valorDentroDoLimite =
        valor >= plano.valorMinimoMensal && valor <= plano.valorMaximoMensal;
      return contratoValido && valorDentroDoLimite;
    })
    .map((plano) => {
      const planoComDesconto = {
        id: plano.id,
        nome: plano.nome,
        valorMinimoMensal: plano.valorMinimoMensal,
        valorMaximoMensal: plano.valorMaximoMensal,
        desconto: plano.desconto,
        contratoPF: plano.contratoPF,
        contratoPJ: plano.contratoPJ,
        valorDesconto: (valor * plano.desconto).toFixed(2),
      };
      return planoComDesconto;
    });

  if (planosFiltrados.length > 0) {
    return planosFiltrados;
  } else {
    return { erro: "Nenhum plano encontrado para o valor e tipo de contrato informados." };
  }
}

console.log(encontrarPlano(1000, "PF"));
