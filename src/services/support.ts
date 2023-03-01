const formatCurrency = (value: number): string => {
  const options = { style: "currency", currency: "BRL" };
  return value.toLocaleString("pt-BR", options);
};

const handleEnergyValue = (person: string): number => {
  return person == "natural" ? 1000 : 100000;
};

export { formatCurrency, handleEnergyValue };
