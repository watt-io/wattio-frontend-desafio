import Button from "@mui/material/Button";
import DialogActions from "@mui/material/DialogActions";
import Text from "../../styles/Typography";
import { StyledDialogContent, StyledLinkMui } from "./style";
import { BootstrapModal, BootstrapModalTitle } from "./BootstrapModalTitle";
import { IModalEconomyStateProps } from "../../interfaces/Modal";
import { formatCurrency } from "../../services/support";

const ModalEconomy = ({ state, setState }: IModalEconomyStateProps) => {
  const { name, discountValue, mensalEconomy, open } = state;

  return (
    <div>
      <BootstrapModal
        onClose={() => setState({ ...state, open: false })}
        aria-labelledby="customized-dialog-title"
        open={open}
      >
        <BootstrapModalTitle
          id="customized-dialog-title"
          onClose={() => setState({ ...state, open: false })}
        >
          <Text>{name}</Text>
        </BootstrapModalTitle>
        <StyledDialogContent sx={{ gap: "1rem" }} dividers>
          <Text tag="h2">Com os serviços da {name}, você pode obter:</Text>
          <Text fontSize="text2">
            Desconto:{" "}
            <Text tag="span" fontSize="text1">
              {discountValue}%
            </Text>
          </Text>
          <Text fontSize="text2">
            Economia anual:{" "}
            <Text tag="span" fontSize="text1">
              {formatCurrency(mensalEconomy * 12)}
            </Text>
          </Text>
          <Text fontSize="text2">
            Em média:{" "}
            <Text tag="span" fontSize="text1">
              {formatCurrency(mensalEconomy)}
            </Text>{" "}
            por mês*
          </Text>
        </StyledDialogContent>
        <DialogActions>
          <Button autoFocus onClick={() => setState({ ...state, open: false })}>
            Ver Outros
          </Button>
          <StyledLinkMui to={"/contrato"}>Contratar</StyledLinkMui>
        </DialogActions>
      </BootstrapModal>
    </div>
  );
};

export default ModalEconomy;
