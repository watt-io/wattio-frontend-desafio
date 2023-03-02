const formatCurrency = (value: number): string => {
  const options = { style: "currency", currency: "BRL" };
  return value.toLocaleString("pt-BR", options);
};

const handleEnergyValue = (person: string): number => {
  return person == "natural" ? 1000 : 100000;
};

const handleDiscount = (
  person: string,
  discountNatural: number,
  discountJuridical: number
) => {
  if (person == "natural") {
    return Math.round(discountNatural * 100);
  }

  return Math.round(discountJuridical * 100);
};

export { formatCurrency, handleEnergyValue, handleDiscount };
