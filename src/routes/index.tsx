import { Route, Routes } from "react-router-dom";
import Main from "../pages/Main";

const RoutesApp = () => {
  return (
    <Routes>
      <Route path="/" element={<Main />}>
        {/* <Route path="/" element={<Main />} /> # Componente que o usuário irá inserir se é juridico / fisico e o valor de sua conta  */}
        {/* <Route path="/" element={<Main />} /> # Componente que o usuário irá receber as ofertas */}
        {/* <Route path="/" element={<Main />} /> # Componente que o usuário irá cadastrar seu nome e seu e-mail para receber a proposta de contrato da oferta pelo e-mail (Simulação)*/}
      </Route>
    </Routes>
  );
};

export default RoutesApp;
