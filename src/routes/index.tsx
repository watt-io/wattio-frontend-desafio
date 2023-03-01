import { Navigate, Route, Routes } from "react-router-dom";
import ReceivedInfo from "../components/ReceivedInfo";
import ReceivedOffers from "../components/ReceivedOffers";
import ReceivedProposal from "../components/ReceivedProposal";
import Main from "../pages/Main";

const RoutesApp = () => {
  return (
    <Routes>
      <Route path="/" element={<Main />}>
        {/* # Componente que o usuário irá inserir se é juridico / fisico e o valor de sua conta  */}
        <Route path="/" element={<ReceivedInfo />} />
        {/* # Componente que o usuário irá receber as ofertas */}
        <Route path="/ofertas" element={<ReceivedOffers />} />
        {/* # Componente que o usuário irá cadastrar seu nome e seu e-mail para receber a proposta de contrato da oferta pelo e-mail (Simulação) */}
        <Route path="/propostas" element={<ReceivedProposal />} />
      </Route>
      <Route path="*" element={<Navigate to={"/"} />} />
    </Routes>
  );
};

export default RoutesApp;
