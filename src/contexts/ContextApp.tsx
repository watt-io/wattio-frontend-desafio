import { createContext, useContext } from "react";
import { IChildrenNode } from "../interfaces/Global";
import { IMainContextProvider } from "../interfaces/MainContext";

const mainContext = createContext<IMainContextProvider>(
  {} as IMainContextProvider
);

const MainContextProvider = ({ children }: IChildrenNode) => {
  return <mainContext.Provider value={{}}>{children}</mainContext.Provider>;
};

const useMainContext = () => useContext(mainContext);

export { MainContextProvider, useMainContext };
