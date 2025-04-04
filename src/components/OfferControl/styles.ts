import DefaultCurrencyInput from "@/shared/components/CurrencyInput";
import styled from "@mui/material/styles/styled";

export const CurrencyInput = styled(DefaultCurrencyInput)(({ theme }) => {
  return {
    display: "flex",
    width: "100%",
    fontFamily: "'Roboto', sans-serif",
    fontSize: "3rem",
    fontWeight: 500,
    transition: "linear 0.4s",
    background: "none",
    border: "none",
    outline: "none",
    color: theme.palette.text.primary,
    "@media(max-width: 800px)": {
      fontSize: "2.5rem",
    },
  };
});
