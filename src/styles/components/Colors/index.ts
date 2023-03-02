import { IColor } from "../../../interfaces/Styles"; 

const setColors = (color: IColor) => {
  switch (color) {
    case "primary":
      return "var(--color-primary)";

    case "secundary":
      return "var(--color-secondary)";

    case "negative":
      return "var(--color-negative)";

    case "error":
      return "var(--color-error)";

    case "success":
      return "var(--color-success)";

    case "alert":
      return "var(--color-alert)";

    case "white":
      return "var(--color-white)";

    case "grey1":
      return "var(--color-grey-1)";

    case "grey2":
      return "var(--color-grey-2)";

    case "grey3":
      return "var(--color-grey-3)";

    case "grey4":
      return "var(--color-grey-4)";

    case undefined:
      return "var(--color-grey-1)";
  }
};

export default setColors;
