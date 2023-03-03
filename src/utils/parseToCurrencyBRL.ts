const parseToCurrencyBRL = (amount: number) =>
  amount.toLocaleString("pt-BR", {
    style: "currency",
    currency: "BRL",
  });

export default parseToCurrencyBRL;
