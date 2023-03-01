import { regexDinheiro } from '../text/regex';

interface InputProps {
    onChange: (v: string) => void;
    value: string | number | readonly string[] | undefined;
    props?: React.InputHTMLAttributes<HTMLInputElement>;
}

export const InputDinheiro = ({ props, onChange, value }: InputProps) => {
    return (
        <input type="text" {...props} onChange={(e) => onChange(regexDinheiro(e.target.value))} value={value || ''} />
    );
};
