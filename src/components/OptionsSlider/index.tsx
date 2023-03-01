import Slider from "@mui/material/Slider";
import { useMainContext } from "../../contexts/ContextApp";
import { IOptionsSliderProps } from "../../interfaces/Home";

const OptionsSlider = ({ min, max, defaultValue }: IOptionsSliderProps) => {
  const { personEntries, setPersonEntries } = useMainContext();

  return (
    <Slider
      onChange={(e, number) =>
        setPersonEntries({
          ...personEntries,
          energyValue: number as number,
        })
      }
      aria-label="Default"
      defaultValue={defaultValue}
      size="small"
      min={min}
      max={max}
      step={250}
    />
  );
};

export default OptionsSlider;
