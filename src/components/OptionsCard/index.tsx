import StyledOptionsCard from "./style";
import { IOptionsCardProps } from "../../interfaces/Home";
import { useMainContext } from "../../contexts/ContextApp";
import { handleEnergyValue } from "../../services/support";

const OptionsCard = ({ name, IconComponent }: IOptionsCardProps) => {
  const { personEntries, setPersonEntries } = useMainContext();
  const { person } = personEntries;

  const handleCardOptions = () => {
    setPersonEntries({
      energyValue: handleEnergyValue(name),
      person: name,
    });
  };

  return (
    <StyledOptionsCard colorized={name == person} onClick={handleCardOptions}>
      <IconComponent />
      {`Pessoa ${name == "juridical" ? "Jurídica" : "Física"}`}
    </StyledOptionsCard>
  );
};

export default OptionsCard;
