import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

export default function About() {
  const [companyInfos, setCompanyInfos] = useState();
  const [discountInfos, setDiscountInfos] = useState();
  const [username, setUsername] = useState();
  const [sobrenome, setSobrenome] = useState();
  const [email, setEmail] = useState();
  const [isLoading, setIsLoading] = useState(true);
  const navigate = useNavigate();

  const loadDatas = async () => {
    const data = JSON.parse(localStorage.getItem("companyInfo"));
    const discounts = JSON.parse(localStorage.getItem("discountInfo"));

    setCompanyInfos(data);
    setDiscountInfos(discounts);
    setIsLoading(false);
  };

  useEffect(() => {
    loadDatas();
  }, []);

  if (isLoading) {
    return "loading...";
  }

  function handleChange(event, setState) {
    setState(event.currentTarget.value);
  }

  const clearInfos = () => {
    localStorage.setItem("companyInfo", "");
    localStorage.setItem("discountInfo", "");
    alert("Nada aconteceu pois essa aplicação é apenas uma simulação.");
    navigate("/");
  };

  return (
    <div className="about-page container">
      <div className="section-1">
        <h1>{companyInfos.name}</h1>
        <div>
          <img src="https://png.pngtree.com/element_our/20190601/ourlarge/pngtree-404-robot-mechanical-vector-image_1358197.jpg"></img>
          <div className="text-space">
            <p>
              {`A empresa ${companyInfos.name} é uma empresa de energia ... Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.`}
            </p>
          </div>
        </div>
      </div>
      <div className="section-2">
        <h4>Com a {`${companyInfos.name}`} sua economia anual será de até</h4>
        <div>{`R$ ${discountInfos.yearDiscount}`} </div>
        <h4>Em média R$ {`${discountInfos.monthDiscount}`} por mês.</h4>
      </div>
      <div className="section-3">
        <h4>
          Caso queira contratar preencha o formulário abaixo para entrar em
          contato com a empresa.
        </h4>
        <h5>
          <span>OBS:</span> Essa é apenas uma simulação, nada acontecerá.
        </h5>
        <form>
          <div className="row">
            <div className="col">
              <label htmlFor="username" className="form-label ">
                Nome
              </label>
              <input
                type="text"
                value={username}
                onChange={(event) => handleChange(event, setUsername)}
                className="form-control"
                id="username"
              />
            </div>
            <div className="col">
              <label htmlFor="sobrenome" className="form-label">
                Sobrenome
              </label>
              <input
                type="text"
                value={sobrenome}
                onChange={(event) => handleChange(event, setSobrenome)}
                className="form-control"
                id="sobrenome"
              />
            </div>
          </div>
          <label htmlFor="user-email" className="form-label">
            Email
          </label>
          <input
            type="text"
            value={email}
            onChange={(event) => handleChange(event, setEmail)}
            className="form-control"
            id="user-email"
          />
          <label htmlFor="user-message" className="form-label">
            Menssagem para a empresa:
          </label>
          <textarea
            id="user-message"
            className="form-control"
            rows="5"
          ></textarea>
        </form>
        <button className="btn btn-primary" onClick={clearInfos}>
          CONTRATAR
        </button>
      </div>
    </div>
  );
}
