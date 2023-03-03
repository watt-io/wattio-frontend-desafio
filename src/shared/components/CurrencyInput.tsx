import MaskedInput, { MaskedInputProps } from "react-text-mask";
import createNumberMask from "text-mask-addons/dist/createNumberMask";
interface CurrencyInputProps extends Omit<MaskedInputProps, "mask"> {
  maskOptions?: typeof defaultMaskOptions;
}

const defaultMaskOptions = {
  prefix: "",
  suffix: "",
  includeThousandsSeparator: true,
  thousandsSeparatorSymbol: ".",
  allowDecimal: true,
  decimalSymbol: ",",
  decimalLimit: 2,
  integerLimit: 6,
  allowNegative: false,
  allowLeadingZeroes: false,
};

const CurrencyInput = ({ maskOptions, ...props }: CurrencyInputProps) => {
  const currencyMask = createNumberMask({
    ...defaultMaskOptions,
  });

  return <MaskedInput mask={currencyMask} {...props} />;
};

export default CurrencyInput;
