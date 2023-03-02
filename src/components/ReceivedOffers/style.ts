import styled from "styled-components";
import { Card } from "@mui/material";

const StyledReceivedOffers = styled.section`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 2rem;
  max-width: 960px;
  width: 100%;
`;

const StyledOffersList = styled.div`
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;

  div {
    flex: 1;
  }
`;

const StyledCard = styled(Card)`
  display: flex;
  flex-direction: column;
  min-width: 230px;

  button {
    align-self: flex-end;
  }

  .MuiCardContent-root {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    gap: 1rem;
    height: 100%;
    min-height: 287px;
  }
`;

export { StyledReceivedOffers, StyledOffersList, StyledCard };
