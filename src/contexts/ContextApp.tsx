import { createContext, useContext, useState } from "react";
import { IChildrenNode } from "../interfaces/Global";
import {
  IMainContextProvider,
  IPersonEntries,
} from "../interfaces/MainContext";

const mainContext = createContext<IMainContextProvider>(
  {} as IMainContextProvider
);

const MainContextProvider = ({ children }: IChildrenNode) => {
  const [personEntries, setPersonEntries] = useState<IPersonEntries>({
    energyValue: 1000,
    person: "natural",
  });

  return (
    <mainContext.Provider value={{ personEntries, setPersonEntries }}>
      {children}
    </mainContext.Provider>
  );
};

const useMainContext = () => useContext(mainContext);

export { MainContextProvider, useMainContext };
