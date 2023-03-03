import { ReactNode } from "react";
import { ThemeProvider as MuiThemeProvider } from "@emotion/react";
import CssBaseline from "@mui/material/CssBaseline";

import darkTheme from "@/constants/themes/dark";
import lightTheme from "@/constants/themes/light";
import { getTheme } from "@/store/reducers/theme/theme.hooks";

interface ThemingProps {
  children: ReactNode;
}

const Theming = ({ children }: ThemingProps) => {
  const themeConfig = getTheme();
  const theme = themeConfig.mode === "dark" ? darkTheme : lightTheme;
  return (
    <MuiThemeProvider theme={{ ...theme }}>
      <CssBaseline />
      {children}
    </MuiThemeProvider>
  );
};

export default Theming;
