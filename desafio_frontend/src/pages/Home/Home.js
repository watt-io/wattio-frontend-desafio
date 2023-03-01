import React, { useEffect, useState } from "react";

import mockAPI from "../../utils/MockAPI";
import sortCompanies from "../../utils/sortCompanies";
import { useNavigate } from "react-router-dom";

export default function Home() {
  const [energyCost, setEnergyCost] = useState(100);
  const [dataAPI, setDataAPI] = useState();
  const [filtredCompanies, setFiltredCompanies] = useState();
  const [loadedDatas, setLoadedDatas] = useState(false);
  const navigate = useNavigate();

  const handleChange = (event, setter) => {
    setter(event.currentTarget.value);
  };

  useEffect(() => {
    setDataAPI(mockAPI);
  }, []);

  const searchFunction = () => {
    const filterAPI = dataAPI.filter(
      (element) =>
        energyCost >= element.minValue && energyCost <= element.maxValue
    );
    setFiltredCompanies(filterAPI.sort(sortCompanies));
    setLoadedDatas(true);
  };

  const companyInfo = (event, element) => {
    localStorage.setItem("companyInfo", JSON.stringify(element));
    const discountInfos = {
      yearDiscount: ((energyCost * element.discount) / 100) * 12,
      monthDiscount: (energyCost * element.discount) / 100,
    };
    localStorage.setItem("discountInfo", JSON.stringify(discountInfos));
    navigate(`/about/${element.name}`);
  };

  return (
    <div className="home-page container">
      <div className="section-1">
        <i className="fa-solid fa-cloud-bolt" id="left-sparckle"></i>
        <div>
          <h1>Economize na energia</h1>
          <h2>Encontre a Cooperativa ideal para você!</h2>
        </div>
        <i className="fa-solid fa-cloud-bolt" id="right-sparckle"></i>
      </div>
      <div className="section-2">
        <h3>
          Insira o valor médio mensal da sua conta de energia e obtenha as
          melhores ofertas!
        </h3>
        <div>
          <input
            type="text"
            placeholder="R$"
            value={energyCost}
            onChange={(event) => handleChange(event, setEnergyCost)}
          />
          <button className="btn btn-primary" onClick={searchFunction}>
            Procurar
          </button>
        </div>
      </div>
      {loadedDatas && (
        <div className="section-3 container-fluid">
          <h3>Selecione uma das ofertas a seguir para calcular a economia.</h3>
          <div className="cards-grid">
            {filtredCompanies.map((element) => (
              <div
                className="company-card"
                onClick={(event) => companyInfo(event, element)}
                key={Math.random()}
              >
                <img src={element.imgLink} alt="company logo"></img>
                <h2>{element.name}</h2>
                <h3>{`${element.discount} %`} </h3>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
