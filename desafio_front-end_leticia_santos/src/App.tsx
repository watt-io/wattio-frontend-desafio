import { useState, useEffect } from 'react';
import logo_Wattio_nome from './assets/logo-wattio2.svg';
import './App.css';
import coperatives from './mocked-data/energyCooperatives.json';
import foneImg from './assets/fone.svg';
import mailImg from './assets/mail.svg';

type Coperative = {
  nome: string,
  valorMinimoMensal: number,
  valorMaximoMensal: number,
  desconto: number,
  restricao: string[]
};

function App() {
  const [accountValue, setAccountValue] = useState(1000);
  const [clickButtonOffer, setClickButtonOfeer] = useState(false);
  const [clickButtonEconomy, setClickButtonEconomy] = useState(false);
  const [changeValue, setChangeValue] = useState(false);
  const [restriction, setRestriction ] = useState('');
  const [chooseOffer, setChooseOffer] = useState(true);
  const [calculusEconomy, setCalculusEconomy] = useState(false);
  const [buttonCalculateOffer, setButtonCalculateOffer] = useState('calcular ofertas');
  const [buttonCalculateEconomy, setButtonCalculateEconomy] = useState('calcular economia');
  const cooperativeEmpty = {
    nome: '',
    valorMinimoMensal: 0,
    valorMaximoMensal: 0,
    desconto: 0,
    restricao: []
  }
  const [data, setData] = useState<Coperative[]>([]);
  const [filteredCoperatives, setFilteredCoperatives] = useState<Coperative[]>([]);
  const [selectedCoperative, setSelectedCoperative] = useState<Coperative>(cooperativeEmpty);
  const [showModal, setShowModal] = useState(false);
  const [economyAnnual, setEconomyAnnual] = useState(0);
  const [economyMonthly, setEconomyMonthly] = useState(0);
  const [showContactModal, setShowContactModal] = useState(false);


  const handleTextChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const inputValue = e.target.value.replace(/\D/g, ''); 
    const numericValue = Number(inputValue);

    if (numericValue >= 0 && numericValue <= 1000000) {
      setAccountValue(numericValue); 
    }
    setChangeValue(false);
  };

  const handleRangeChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setAccountValue(Number(e.target.value));
    setChangeValue(false);
  };

  const calculateOffer = () => {
    setCalculusEconomy(true);
    setClickButtonOfeer(true);
    setButtonCalculateOffer('recalcular ofertas');
    setChangeValue(true);
    setSelectedCoperative(cooperativeEmpty);

    const filtered = data.filter(coop => 
      ((accountValue >= coop.valorMinimoMensal && accountValue <= coop.valorMaximoMensal) && (coop.restricao.includes(restriction) || restriction == ''))
    );
    setFilteredCoperatives(filtered);
  }

  const handleCoperativeSelect = (coop: Coperative) => {
    setChooseOffer(false);
    setSelectedCoperative(coop);
  };

  const calculateEconomy = () => {
    setChooseOffer(true);
    setClickButtonEconomy(true);
    setButtonCalculateEconomy('recalcular economia');
    setShowModal(true);
    const annualEconomy = (accountValue * 12) * selectedCoperative?.desconto;
    const monthlyEconomy = annualEconomy / 12;

    setEconomyAnnual(annualEconomy);
    setEconomyMonthly(monthlyEconomy);
  }

  const closeModal = () => {
    setShowModal(false);
  };

  const handleContactClick = () => {
    setShowContactModal(true);
  };
  
  const closeContactModal = () => {
    setShowContactModal(false);
  };

  useEffect(() => {
    setData(coperatives);
  }, []);

  return (
    <>
      <header className='header'>
        <a href='https://www.wattio.com.br/' target='_blank' className='link-logo'>
          <img src={logo_Wattio_nome} className='logo' alt='Wattio logo' />
        </a>
        <div className='container-links-header'>
          <a href='https://www.wattio.com.br/' className='link-header'>home</a>
          <a href={location.pathname} className='link-header active'>calcular economia</a>
          <a href='https://www.wattio.com.br/funcionalidades' className='link-header'>funcionalidades</a>
          <a href='https://www.wattio.com.br/sobre-a-wattio' className='link-header'>sobre a wattio</a>
        </div>
        <div className='container-buttons'>
          <button type='button' className='container-buttons-contact' onClick={handleContactClick}>fale conosco</button>
          <a href='https://saas.wattio.com.br/web/login' className='container-buttons-login'>login</a>
        </div>
      </header>
      <main className='main'>
          <form className='calculate-offer'>
            <h1 className='calculate-offer-title'>CALCULAR ECONOMIA</h1>
            <p className='calculate-offer-p1'>valor médio mensal da sua conta de energia:</p>
            <input 
              type='text' 
              value={`R$${accountValue.toLocaleString()}`} 
              className='calculate-offer-input' 
              onChange={handleTextChange} 
            />
            <p className='calculate-offer-p2'>digite o valor acima ou mova a barra abaixo. Valor máximo de R$1.000.000,00</p>
            <input 
              type='range' 
              className='calculate-offer-range' 
              min='0' 
              max='1000000' 
              step='100' 
              value={accountValue} 
              onChange={handleRangeChange} 
            />
            <div className='calculate-offer-restriction'>
              <label className='calculate-offer-restriction-label'>
                <input
                  type='radio'
                  name='person-type'
                  value='fisica'
                  className='calculate-offer-restriction-input'
                  onChange={() => {setRestriction('PF');
                    setChangeValue(false)}}
                />
                Pessoa Física
              </label>
              <label className='calculate-offer-restriction-label'>
                <input
                  type='radio'
                  name='person-type'
                  value='juridica'
                  className='calculate-offer-restriction-input'
                  onChange={() => {setRestriction('PJ');
                    setChangeValue(false)}}
                />
                Pessoa Jurídica
              </label>
            </div>

            <button type='button' className={`calculate-offer-button ${clickButtonOffer ? 'clicked' : ''}`} onClick={calculateOffer} disabled={changeValue}>{buttonCalculateOffer}</button>
            </form>
            {calculusEconomy && (
            <form className='calculate-economy'>
              {filteredCoperatives.length > 0 ? (
                filteredCoperatives.map((coop, index) => (
                  <div 
                    key={index} 
                    className={`coop-card ${selectedCoperative?.nome === coop.nome ? 'selected' : ''}`} 
                  >
                    <div className='coop-card-header'>
                      <input 
                        type='checkbox' 
                        checked={selectedCoperative?.nome === coop.nome} 
                        onChange={() => handleCoperativeSelect(coop)} className='coop-card-header-input'
                      />
                      <h3 className='coop-card-header-h3'>Oferta {index + 1}</h3>
                    </div>
                    <div className='coop-card-data'>
                      <p><span className='highlight'>Cooperativa:</span> {coop.nome}</p>
                      <p><span className='highlight'>Desconto:</span> {coop.desconto * 100}%</p>
                    </div>
                    
                  </div>
                ))
              ) : (
                <p className='calculate-economy-p1'>Nenhuma oferta encontrada</p>
              )}
              <button 
                type='button' 
                className={`calculate-economy-button ${clickButtonEconomy ? 'clicked' : ''}`} 
                disabled={chooseOffer}
                onClick={calculateEconomy}
              >
                {buttonCalculateEconomy}
              </button>
            </form>
          )}
          {showModal && (
            <div className='modal'>
              <div className='modal-economy'>
                <button className='modal-close' onClick={closeModal}>×</button>
                <p className='modal-content'>Economia anual de até</p>
                <p className='modal-content-annual'>
                  {economyAnnual.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                </p>
                <p className='modal-content-monthly'>
                  em média <span className='modal-content-monthly-value'>
                    {economyMonthly.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                  </span> por mês*
                </p>
                <p className='modal-content-warning'>*essa é apenas uma simulação e não configura garantia de desconto.</p>
                <button className='modal-hire' onClick={handleContactClick}>contratar</button>
              </div>
            </div>
          )}
          {showContactModal && (
            <div className='modal'>
              <div className='modal-contact'>
                <button className='modal-close' onClick={closeContactModal}>×</button>
                <p className='modal-content'>agende uma demostração pelos seguintes contatos:</p>
                <p className='modal-content-contact'><img src={foneImg} alt='Imagem de telefone' className='modal-content-contact-img'/> +55 (35) 9 9774-9672</p>
                <p className='modal-content-contact'><img src={mailImg} alt='Imagem de e-mail' className='modal-content-contact-img'/> relacionamento@wattio.com.br</p>
              </div>
            </div>
          )}
      </main>
    </>
  )
}

export default App
