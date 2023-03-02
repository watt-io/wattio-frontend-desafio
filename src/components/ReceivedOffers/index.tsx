import Text from "../../styles/Typography";
import CardActions from "@mui/material/CardActions";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import ModalEconomy from "../ModalEconomy";
import ArrowBackIcon from "@mui/icons-material/ArrowBack";
import { handleDiscount } from "../../services/support";
import { useEffect } from "react";
import { useMainContext } from "../../contexts/ContextApp";
import { StyledCard, StyledOffersList, StyledReceivedOffers } from "./style";
import { StyledNavigationLink } from "../../styles/components/Link";

const ReceivedOffers = () => {
  const {
    personEntries,
    handleSearchOffers,
    offers,
    modalData,
    setModalData,
    handleOpenModal,
  } = useMainContext();
  const { person } = personEntries;

  useEffect(() => handleSearchOffers, []);

  return (
    <StyledReceivedOffers>
      <StyledNavigationLink to={"/"}>
        <ArrowBackIcon />
      </StyledNavigationLink>
      <Text>Ofertas encontradas:</Text>
      <Text fontSize="text3">
        Veja as ofertas disponíveis e descubra quanto você pode economizar.
        Contrate agora um dos nossos pacotes e comece a economizar hoje mesmo!
      </Text>
      <Text fontSize="text4" color="grey4">
        * Se os valores de busca não forem informados, a pesquisa será realizada
        considerando uma pessoa física com média de R$ 1000.00,00 em gastos.
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
                  <Button
                    onClick={() =>
                      handleOpenModal(
                        {
                          name,
                          discountNatural: discountNatural || 0,
                          discountJuridical: discountJuridical || 0,
                        },
                        personEntries
                      )
                    }
                    size="small"
                  >
                    Calcular Economia
                  </Button>
                </CardActions>
              </StyledCard>
            );
          }
        )}
      </StyledOffersList>
      <ModalEconomy state={modalData} setState={setModalData} />
    </StyledReceivedOffers>
  );
};

export default ReceivedOffers;
