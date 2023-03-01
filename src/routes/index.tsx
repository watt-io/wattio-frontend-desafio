import { Navigate, Route, Routes } from "react-router-dom";
import ReceivedInfo from "../components/ReceivedInfo";
import ReceivedOffers from "../components/ReceivedOffers";
import ReceivedProposal from "../components/ReceivedProposal";
import Main from "../pages/Main";

const RoutesApp = () => {
  return (
    <Routes>
      <Route path="/" element={<Main />}>
        <Route path="/" element={<ReceivedInfo />} />
        <Route path="/ofertas" element={<ReceivedOffers />} />
        <Route path="/propostas" element={<ReceivedProposal />} />
      </Route>
      <Route path="*" element={<Navigate to={"/"} />} />
    </Routes>
  );
};

export default RoutesApp;
