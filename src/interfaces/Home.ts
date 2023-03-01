import { SvgIconTypeMap } from "@mui/material";
import { OverridableComponent } from "@mui/material/OverridableComponent";

export interface IOptionsCardProps {
  name: string;
  IconComponent: OverridableComponent<SvgIconTypeMap<{}, "svg">> & {
    muiName: string;
  };
}

export interface IOptionsSliderProps {
  min: number;
  max: number;
  defaultValue: number;
}
