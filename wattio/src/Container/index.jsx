import * as S from './style.js';
import { useState } from 'react';
import { OfferContext, useOfferContext } from '../Context/index.jsx';

function Container() {
  const [inputValue, setInputValue] = useState('R$1.000,00');
  const [offers, setOffers] = useState([]);
  const [selectedOffer, setSelectedOffer] = useState(null);
  const [economy, setEconomy] = useState(null);

  function handleOnChange(event) {
    const inputValue = event.target.value;
    setInputValue(inputValue);
  }

  function getAvailableOffers(value) {
    const numericValue = parseFloat(value.replace(/\D/g, '')) / 100;

    const availableOffers = [
      {
        nome: 'EnerFácil',
        valorMinimoMensal: 1000,
        valorMaximoMensal: 40000,
        desconto: 0.2,
      },
      {
        nome: 'EnerLimpa',
        valorMinimoMensal: 10000,
        valorMaximoMensal: 80000,
        desconto: 0.25,
      },
      {
        nome: 'EnerGrande',
        valorMinimoMensal: 40000,
        valorMaximoMensal: 100000,
        desconto: 0.3,
      },
    ];

    const filteredOffers = availableOffers.filter(
      offer =>
        numericValue >= offer.valorMinimoMensal &&
        numericValue <= offer.valorMaximoMensal
    );

    return filteredOffers;
  }

  function handleOnSubmit(event) {
    event.preventDefault();
    const availableOffers = getAvailableOffers(inputValue);
    setOffers(availableOffers);
  }

  function handleOfferChange(event) {
    const selectedOfferName = event.target.value;
    const selectedOffer = offers.find(offer => offer.nome === selectedOfferName);
    setSelectedOffer(selectedOffer);
    setEconomy(null);
  }

  function handleCalculateEconomy() {
    if (selectedOffer) {
      const numericValue = parseFloat(inputValue.replace(/\D/g, '')) / 100;
      const calculatedEconomy = numericValue * selectedOffer.desconto;
      setEconomy(calculatedEconomy);
    }
  }

  function OfferSection() {
    const { offers, selectedOffer, economy, handleOfferChange, handleCalculateEconomy } = useOfferContext();

    return (
      <S.OffersDiv>
        <S.Title>Ofertas Disponíveis:</S.Title>
        <S.UlOffers>
          {offers.map((offer, index) => (
            <S.LiOffers key={index}>
              <S.LabelOffers htmlFor={`offer_${index}`}>
                <input
                  id={`offer_${index}`}
                  type="radio"
                  value={offer.nome}
                  checked={selectedOffer && selectedOffer.nome === offer.nome}
                  onChange={handleOfferChange}
                />
                {offer.nome} - Desconto: {offer.desconto * 100}%
              </S.LabelOffers>
            </S.LiOffers>
          ))}
        </S.UlOffers>
        {selectedOffer && (
          <S.SelectedOfferDiv>
            <S.Title>Oferta Selecionada:</S.Title>
            <S.SelectedOfferP>{selectedOffer.nome}</S.SelectedOfferP>
            <S.EconomyButton onClick={handleCalculateEconomy}>
              Calcular Economia!
            </S.EconomyButton>
            {economy !== null && (
              <S.EconomyParagraph>Sua economia será de R${economy * 12},00 por ano! <br /> Cerca de R${economy},00 por mês!</S.EconomyParagraph>
            )}
          </S.SelectedOfferDiv>
        )}
      </S.OffersDiv>
    );
  }


  return (
    <OfferContext.Provider
      value={{
        offers,
        selectedOffer,
        economy,
        handleOfferChange,
        handleCalculateEconomy
      }}
    >
      <S.MainContainer onSubmit={handleOnSubmit}>
        <S.Title>Calcule a economia da sua empresa</S.Title>
        <S.Description>
          O valor médio mensal da minha conta de energia é:
        </S.Description>
        <S.Input value={inputValue} onChange={handleOnChange} />
        <S.InputDescription>Digite o valor. Mínimo de R$1.000,00 máximo de R$99.999,00</S.InputDescription>
        <S.CalculateButton type="submit">Calcular Ofertas!</S.CalculateButton>
      </S.MainContainer>
      {offers.length > 0 && <OfferSection />}
    </OfferContext.Provider>
  );
}

export default Container;
