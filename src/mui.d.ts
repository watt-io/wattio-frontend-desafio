import {
  Palette as MuiPalette,
  PaletteOptions as MuiPaletteOptions,
} from "@mui/material/styles/createPalette";

declare module "@mui/material/styles/createPalette" {
  interface Palette extends MuiPalette {
    custom: {
      boxHover: string;
    };
  }

  interface PaletteOptions extends MuiPaletteOptions {
    custom: {
      boxHover: string;
    };
  }
}
