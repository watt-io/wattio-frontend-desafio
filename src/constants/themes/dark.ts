import { blue, green } from "@mui/material/colors";
import createTheme from "@mui/material/styles/createTheme";

const theme = createTheme({
  palette: {
    mode: "dark",
    primary: blue,
    secondary: green,
    custom: {
      boxHover: "#1d1d1d",
    },
  },
});

export default theme;
