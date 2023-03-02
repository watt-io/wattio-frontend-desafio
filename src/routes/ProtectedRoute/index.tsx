import { Navigate } from "react-router-dom";
import { useMainContext } from "../../contexts/ContextApp";

const ProtectedRoutes = ({ children }: any) => {
  const { offers } = useMainContext();

  return offers ? children : <Navigate to={"/"} />;
};

export default ProtectedRoutes;
