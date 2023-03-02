import { createContext, useContext, useState } from "react";
import data from "../database";
import { IChildrenNode, IDatabase } from "../interfaces/Global";
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
  const [offers, setOffers] = useState<IDatabase[]>();

  const handleSearchOffers = () => {
    const { energyValue, person } = personEntries;
    const Offers = data.filter(({ maxValue, minValue, models }) => {
      return (
        energyValue >= minValue &&
        energyValue <= maxValue &&
        models.includes(person)
      );
    });

    setOffers(Offers);
  };

  return (
    <mainContext.Provider
      value={{ personEntries, setPersonEntries, handleSearchOffers, offers }}
    >
      {children}
    </mainContext.Provider>
  );
};

const useMainContext = () => useContext(mainContext);

export { MainContextProvider, useMainContext };
