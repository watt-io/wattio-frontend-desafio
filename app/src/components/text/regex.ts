export function regexDinheiro(value: string): string {
    if (!Number(value) && value.length < 2) return '';
    if (!value) return '';

    value = value.replace('.', '').replace(',', '').replace(/\D/g, '');

    const options = { minimumFractionDigits: 2 };
    const result = new Intl.NumberFormat('pt-BR', options).format(parseFloat(value) / 100);

    return 'R$ ' + result;
}
