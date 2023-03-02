import StyledOptionsCard from "./style";
import Text from "../../styles/Typography";
import { IOptionsCardProps } from "../../interfaces/Home";
import { useMainContext } from "../../contexts/ContextApp";
import { formatCurrency, handleEnergyValue } from "../../services/support";

const OptionsCard = ({ name, IconComponent }: IOptionsCardProps) => {
  const { personEntries, setPersonEntries } = useMainContext();
  const { person } = personEntries;

  const handleCardOptions = () => {
    if (person == name) return;

    setPersonEntries({
      energyValue: handleEnergyValue(name),
      person: name,
    });
  };

  return (
    <StyledOptionsCard colorized={name == person} onClick={handleCardOptions}>
      <IconComponent />
      <Text>{`Pessoa ${name == "juridical" ? "Jurídica" : "Física"}`}</Text>
      <Text fontSize="text4" color="grey4">
        Valor Mínimo:{" "}
        {name == "juridical" ? formatCurrency(100000) : formatCurrency(1000)}
      </Text>
    </StyledOptionsCard>
  );
};

export default OptionsCard;
