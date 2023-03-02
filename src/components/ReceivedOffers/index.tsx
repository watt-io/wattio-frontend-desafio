import Text from "../../styles/Typography";
import CardActions from "@mui/material/CardActions";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { handleDiscount } from "../../services/support";
import { useEffect, useState } from "react";
import { useMainContext } from "../../contexts/ContextApp";
import { StyledCard, StyledOffersList, StyledReceivedOffers } from "./style";

const ReceivedOffers = () => {
  const { personEntries, handleSearchOffers, offers } = useMainContext();
  const { person } = personEntries;
  const [selectedValue, setSelectedValue] = useState("EnerFácil");

  useEffect(() => handleSearchOffers, []);
  return (
    <StyledReceivedOffers>
      <Text>Ofertas encontradas:</Text>
      <Text fontSize="text3">
        Veja as ofertas disponíveis e descubra quanto você pode economizar.
        Contrate agora um dos nossos pacotes e comece a economizar hoje mesmo!
      </Text>
      <StyledOffersList>
        {offers?.map(
          (
            { name, description, discountNatural, discountJuridical },
            index
          ) => {
            return (
              <StyledCard key={index + name}>
                <CardContent>
                  <Typography fontSize="1.3rem">{name}</Typography>
                  <Typography color="text.secondary">{description}</Typography>
                  <Typography color="text.primary">
                    Economia:{" "}
                    {handleDiscount(
                      person,
                      discountNatural || 0,
                      discountJuridical || 0
                    )}
                    %
                  </Typography>
                </CardContent>
                <CardActions>
                  <Button onClick={() => setSelectedValue(name)} size="small">
                    Calcular Economia
                  </Button>
                </CardActions>
              </StyledCard>
            );
          }
        )}
      </StyledOffersList>
    </StyledReceivedOffers>
  );
};

export default ReceivedOffers;
