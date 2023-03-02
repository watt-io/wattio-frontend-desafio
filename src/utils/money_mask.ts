export function money_mask(v: number | string) {
  let conv = v.toString();
  conv = conv.replace(/\D/g, '');
  conv = conv.replace(/(\d{1})(\d{15})$/, '$1.$2');
  conv = conv.replace(/(\d{1})(\d{11})$/, '$1.$2');
  conv = conv.replace(/(\d{1})(\d{8})$/, '$1.$2');
  conv = conv.replace(/(\d{1})(\d{5})$/, '$1.$2');
  conv = conv.replace(/(\d{1})(\d{1,2})$/, '$1,$2');
  return `${conv}`;
}
