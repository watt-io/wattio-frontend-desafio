import Text from "../../styles/Typography";
import ScreenSearchDesktopIcon from "@mui/icons-material/ScreenSearchDesktop";
import PersonIcon from "@mui/icons-material/Person";
import BusinessIcon from "@mui/icons-material/Business";
import Chip from "@mui/material/Chip";
import OptionsCard from "../OptionsCard";
import OptionsSlider from "../OptionsSlider";
import { StyledReceivedInfo } from "./style";
import { useMainContext } from "../../contexts/ContextApp";
import { formatCurrency } from "../../services/support";
import { Link } from "react-router-dom";

const ReceivedInfo = () => {
  const { personEntries } = useMainContext();
  const { energyValue, person } = personEntries;

  return (
    <StyledReceivedInfo>
      <div>
        <ScreenSearchDesktopIcon fontSize="large" />
        <Text tag="h2" fontSize="text2">
          Encontre as melhores ofertas das nossas coperativas.
        </Text>
      </div>

      <form onSubmit={(e) => e.preventDefault()}>
        <div>
          <OptionsCard IconComponent={PersonIcon} name="natural" />
          <OptionsCard IconComponent={BusinessIcon} name="juridical" />
        </div>
        <div>
          <Text fontSize="text3">
            O valor médio mensal da minha conta de energia é:
          </Text>
          <Chip label={formatCurrency(energyValue)} />
          {person == "natural" && (
            <OptionsSlider min={1000} max={100000} defaultValue={1000} />
          )}
          {person == "juridical" && (
            <OptionsSlider min={100000} max={1000000} defaultValue={100000} />
          )}
        </div>

        <Link to={"/ofertas"}>Buscar ofertas</Link>
      </form>
    </StyledReceivedInfo>
  );
};

export default ReceivedInfo;
