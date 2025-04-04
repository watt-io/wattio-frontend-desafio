import { blue, green } from "@mui/material/colors";
import createTheme from "@mui/material/styles/createTheme";

const theme = createTheme({
  palette: {
    mode: "light",
    background: {
      default: "#ddd",
    },
    primary: blue,
    secondary: green,
    custom: {
      boxHover: "#e8e8e8",
    },
  },
});

export default theme;
