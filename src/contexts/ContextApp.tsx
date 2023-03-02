import data from "../database";
import emailjs from "@emailjs/browser";
import { createContext, useContext, useState } from "react";
import { IChildrenNode, IDatabase } from "../interfaces/Global";
import { IModalCompanyProps, IModalEconomyState } from "../interfaces/Modal";
import { handleDiscount } from "../services/support";
import {
  IMainContextProvider,
  IPersonEntries,
  IProposalForm,
} from "../interfaces/MainContext";
import { toast } from "react-toastify";
import { useNavigate } from "react-router-dom";

const mainContext = createContext<IMainContextProvider>(
  {} as IMainContextProvider
);

const MainContextProvider = ({ children }: IChildrenNode) => {
  const navigate = useNavigate();
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
  const [loading, setLoading] = useState(false);

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

  const sendEmail = async (data: IProposalForm) => {
    const { to_name, to_email } = data;
    const templateParams = {
      to_name,
      to_email,
      cooperative_name: modalData.name || "Inowatt",
      reply_to: "gabrielbsnsp@gmail.com",
    };

    try {
      await emailjs.send(
        "service_bljycff",
        "template_z2i73gk",
        templateParams,
        "HkQ6UoyjCLp0aRzdp"
      );

      toast.success("Proposta recebida, verifique seu e-mail!", {
        autoClose: 3000,
      });

      navigate("/");
    } catch (err) {
      toast.error("Dados inválidos, verifique os campos obrigatórios!");
    } finally {
      setLoading(false);
    }
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
        sendEmail,
        loading,
        setLoading,
      }}
    >
      {children}
    </mainContext.Provider>
  );
};

const useMainContext = () => useContext(mainContext);

export { MainContextProvider, useMainContext };
