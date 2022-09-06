import * as yup from 'yup'

export const schema = yup.object({
  nomeEmpresa: yup.string().max(1500, 'Máximo de 1500 caracteres').required('Nome/Empresa é obrigatório'),
  valorMensal: yup.number().typeError('Valor mensal é obrigatório').min(1000,'Valor mínimo é R$1.000').required('Valor mensal é obrigatório')
}).required()