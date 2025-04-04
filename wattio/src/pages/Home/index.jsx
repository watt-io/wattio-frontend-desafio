import { useEffect, useState } from "react";
import "./styles.css";
import bd from "../../service/bd";

function Home() {
  const [value, setValue] = useState(1000);
  const [person, setPerson] = useState("PJ");
  const [averageValue, setAverageValue] = useState(0);
  const [isSearch, setIsSearch] = useState(true);
  const [coops, setCoops] = useState([]);
  const [selectCoop, setSelectCoop] = useState(null);
  const [monthlySavings, setMonthlySavings] = useState(0);

  function changeSearch(clearInfos) {
    setIsSearch(!isSearch);
    setMonthlySavings(0);
    if (clearInfos) {
      setValue(1000);
      setAverageValue(0);
      setCoops([]);
      setSelectCoop(null);
      setPerson("PJ")
    }
  }

  function searchCoops() {
    if (person === "PJ") {
      const list = bd.Cooperativas.filter((iten) => {
        return (
          iten.valorMaximoMensal >= value &&
          iten.valorMinimoMensal <= value &&
          iten.apenasPF === false
        );
      });
      setCoops(list);
    } else {
      const list = bd.Cooperativas.filter((iten) => {
        return (
          iten.valorMaximoMensal >= value &&
          iten.valorMinimoMensal <= value &&
          iten.apenasPJ === false
        );
      });
      setCoops(list);
    }
    setAverageValue(value);
    changeSearch(false);
    setSelectCoop("");
  }

  function handleInput(e) {
    if (e.target.value <= 100000 && e.target.value >= 1000) {
      setValue(e.target.value);
    }
  }

  function handlePerson(e) {
    setPerson(e.target.value);
  }

  function handleCoop(coop) {
    setSelectCoop(coop);
  }

  function handleSavings() {
    setMonthlySavings(selectCoop.desconto * averageValue);
  }

  useEffect(() => {}, [averageValue]);

  return (
    <div className="home flexColumn">
      <h1 className="welcomeMessage">Nossas boas-vindas para você.</h1>
      <p className="welcomeInfo">Complete as informações abaixo e busque a melhor oferta para o seu momento.</p>
      <section className="searchSection flexColumn">
        <span>O valor médio mensal da sua conta de energia é:</span>
        <h2>
          {(value * 1).toLocaleString("pt-br", {
            style: "currency",
            currency: "BRL",
          })}
        </h2>
        <input
          type="number"
          value={value}
          onChange={handleInput}
          max="100000"
          min="1000"
        />
        <input
          type="range"
          value={value}
          onChange={handleInput}
          max="100000"
          min="1000"
          step="1"
        />
        <div className="flexRow personInput">
          <input
            type="radio"
            value="PJ"
            id="PJ"
            name="PJorPF"
            onChange={(e) => handlePerson(e)}
            checked={person === 'PJ' && 'defaultChecked'}
          />
          <label htmlFor="PJ">Pessoa Jurídica</label>
          <input
            type="radio"
            value="PF"
            id="PF"
            name="PJorPF"
            onChange={(e) => handlePerson(e)}
            checked={person !== 'PJ' && 'defaultChecked'}
          />
          <label htmlFor="PF">Pessoa Fisica</label>
        </div>
        <div className="flexRow searchBtn">
          <button type="button" onClick={searchCoops}>
            {averageValue > 0 ? "Nova busca" : "Buscar Alternativas"}
          </button>
          {averageValue > 0 && (
            <button type="button" onClick={() => changeSearch(true)}>
              Começar novamente
            </button>
          )}
        </div>
      </section>
      <section className="infosSection flexRow">
        <section className="listSection">
          {coops.length > 0 ? (
            <div>
              {coops.map((coop) => {
                return (
                  <div key={coop.nome} className="flexRow itenRadio">
                    <input
                      type="radio"
                      value={coop.nome}
                      id={coop.nome}
                      name="selectCoop"
                      onChange={() => handleCoop(coop)}
                    />
                    <article className="labelRadio flexColumn">
                      <span>Cooperativa: {coop.nome}</span>
                      <span>
                        Economia de {(coop.desconto * 100).toFixed(1)}%
                      </span>
                    </article>
                  </div>
                );
              })}
              {/* {selectCoop && (
              <button type="button" onClick={handleSavings}>
                Calcular Economia
              </button>
            )} */}
            </div>
          ) : (
            <h2>
              Busque as melhores opções de economia para você com as nossas
              cooperativas associadas.{" "}
            </h2>
          )}
        </section>
        <section className="proposalSection flexColumn">
          <button
            type="button"
            onClick={handleSavings}
            className={selectCoop ? "visible" : "invisible"}
          >
            Calcular Economia
          </button>
          {monthlySavings !== 0 && (
            <div className="flexColumn">
              <p className="messageYear">
                Sua economia anual será de até:
                <span>
                  {(monthlySavings * 12).toLocaleString("pt-br", {
                    style: "currency",
                    currency: "BRL",
                  })}
                </span>
              </p>
              <p className="messageMonth">
                {`Em média ${(monthlySavings * 1).toLocaleString("pt-br", {
                  style: "currency",
                  currency: "BRL",
                })} por mês.*`}
              </p>
              <p>
                *Isso é apenas uma simulação, não é uma garantia de desconto
              </p>
              <a href="/" className="subscribeLink">
                Quero Contratar
              </a>
            </div>
          )}
        </section>
      </section>
    </div>
  );
}

export default Home;
