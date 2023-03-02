import Main from "../pages/Main";
import ReceivedInfo from "../components/ReceivedInfo";
import ReceivedOffers from "../components/ReceivedOffers";
import ReceivedProposal from "../components/ReceivedProposal";
import { Navigate, Route, Routes } from "react-router-dom";
import ProtectedRoutes from "./ProtectedRoute";

const RoutesApp = () => {
  return (
    <Routes>
      <Route path="/" element={<Main />}>
        <Route path="/" element={<ReceivedInfo />} />
        <Route
          path="/ofertas"
          element={
            <ProtectedRoutes>
              <ReceivedOffers />
            </ProtectedRoutes>
          }
        />
        <Route
          path="/contrato"
          element={
            <ProtectedRoutes>
              <ReceivedProposal />
            </ProtectedRoutes>
          }
        />
      </Route>
      <Route path="*" element={<Navigate to={"/"} />} />
    </Routes>
  );
};

export default RoutesApp;
