import data from "../database";
import { createContext, useContext, useState } from "react";
import { IChildrenNode, IDatabase } from "../interfaces/Global";
import { IModalCompanyProps, IModalEconomyState } from "../interfaces/Modal";
import { handleDiscount } from "../services/support";
import {
  IMainContextProvider,
  IPersonEntries,
} from "../interfaces/MainContext";
import { useNavigate } from "react-router-dom";

const mainContext = createContext<IMainContextProvider>(
  {} as IMainContextProvider
);

const MainContextProvider = ({ children }: IChildrenNode) => {
  const [personEntries, setPersonEntries] = useState<IPersonEntries>({
    energyValue: 1000,
    person: "natural",
  });
  const [modalData, setModalData] = useState<IModalEconomyState>({
    name: "",
    discountValue: 0,
    mensalEconomy: 0,
    open: false,
  });
  const [offers, setOffers] = useState<IDatabase[]>();
  const navigate = useNavigate();

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

  const handleOpenModal = (
    company: IModalCompanyProps,
    person: IPersonEntries
  ) => {
    const { discountNatural, discountJuridical, name } = company;
    const { person: personType, energyValue } = person;
    const discountValue = handleDiscount(
      personType,
      discountNatural,
      discountJuridical
    );

    const percentage = energyValue * (discountValue / 100);

    const data = {
      name,
      discountValue,
      mensalEconomy: percentage,
      open: true,
    };

    setModalData(data);
  };

  return (
    <mainContext.Provider
      value={{
        personEntries,
        setPersonEntries,
        handleSearchOffers,
        offers,
        modalData,
        setModalData,
        handleOpenModal,
      }}
    >
      {children}
    </mainContext.Provider>
  );
};

const useMainContext = () => useContext(mainContext);

export { MainContextProvider, useMainContext };
