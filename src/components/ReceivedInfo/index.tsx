import Text from "../../styles/Typography";
import PersonIcon from "@mui/icons-material/Person";
import BusinessIcon from "@mui/icons-material/Business";
import SearchIcon from "@mui/icons-material/Search";
import OptionsCard from "../OptionsCard";
import OptionsSlider from "../OptionsSlider";
import FormControl from "@mui/material/FormControl";
import InputLabel from "@mui/material/InputLabel";
import FilledInput from "@mui/material/FilledInput";
import { StyledLink } from "../../styles/components/Link";
import { StyledReceivedInfo } from "./style";
import { useMainContext } from "../../contexts/ContextApp";
import { formatCurrency } from "../../services/support";
import { useNavigate } from "react-router-dom";

const ReceivedInfo = () => {
  const { personEntries, handleSearchOffers } = useMainContext();
  const { energyValue, person } = personEntries;
  const navigate = useNavigate();

  const renderOffers = () => {
    handleSearchOffers();
    navigate("/ofertas");
  };

  return (
    <StyledReceivedInfo>
      <div className="received__info--header">
        <Text tag="h2" fontSize="text2">
          Encontre as melhores ofertas das nossas coperativas.
        </Text>
      </div>

      <form onSubmit={(e) => e.preventDefault()}>
        <div className="received__info--card">
          <OptionsCard IconComponent={PersonIcon} name="natural" />
          <OptionsCard IconComponent={BusinessIcon} name="juridical" />
        </div>
        <Text fontSize="text3">
          O valor médio mensal da minha conta de energia é:
        </Text>
        <FormControl variant="filled" sx={{ gap: "0.5rem" }}>
          <InputLabel htmlFor="filled-adornment-amount">
            Mova a barra para definir a média da sua conta de energia:
          </InputLabel>
          <FilledInput
            id="filled-adornment-amount"
            value={formatCurrency(energyValue)}
            onChange={() => formatCurrency}
          />
          {person == "natural" && (
            <OptionsSlider min={1000} max={100000} defaultValue={1000} />
          )}
          {person == "juridical" && (
            <OptionsSlider min={100000} max={1000000} defaultValue={100000} />
          )}
        </FormControl>
        <StyledLink onClick={renderOffers}>
          <Text color="white">Buscar Ofertas</Text>
          <SearchIcon />
        </StyledLink>
      </form>
    </StyledReceivedInfo>
  );
};

export default ReceivedInfo;
