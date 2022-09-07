import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Container from 'react-bootstrap/Container';
import InputGroup from 'react-bootstrap/InputGroup';
import { useForm } from 'react-hook-form'
import { yupResolver } from '@hookform/resolvers/yup'
import { schema } from './validacaoForm';
import { ContextoCliente } from '@store/ContextoCliente'
import { useContext } from 'react';

export default function Home(){

  const { register, handleSubmit, formState: {errors} } = useForm({
    resolver: yupResolver(schema)
  })

  const { goToPage, salvarDadosCliente } = useContext(ContextoCliente)

  const procurarCoorperativas = (data) =>{
    salvarDadosCliente(data)
    goToPage('/compararCoorperativas')
  }

  return(
    <Container>
      <Form className="mt-4" onSubmit={handleSubmit(procurarCoorperativas)}>
      <Form.Group className="mb-3" controlId="formBasicEmpresa">
        <Form.Label>*Nome/Empresa</Form.Label>
        <Form.Control type="text" {...register('nomeEmpresa')}/>
        <Form.Text className="text-muted">
          <p className='m-0 mt-1 text-danger'>{errors.nomeEmpresa?.message}</p>
        </Form.Text>
      </Form.Group>
      <Form.Group className="mb-3" controlId="formBasicValorMensal">
      <Form.Label>*Valor médio mensal de energia da minha casa/empresa</Form.Label>
      <InputGroup>
        <InputGroup.Text id="valorMensal">R$</InputGroup.Text>
        <Form.Control {...register('valorMensal')} type="number" aria-label="valorMensal" aria-describedby="valorMensal"/>
      </InputGroup>
      <Form.Text className="text-muted">
        <p className='m-0 mt-1 text-danger'>{errors.valorMensal?.message}</p>
      </Form.Text>
      </Form.Group>
      <Form.Group>
        <Form.Label className='me-3'>*Tipo de cliente:</Form.Label>
        <Form.Select aria-label="Tipo de cliente" {...register('tipoCliente')}>
          <option value="PF">PF</option>
          <option value="PJ">PJ</option>
        </Form.Select>
      </Form.Group>
      <Button variant="primary" type="submit" className="mt-3">Procurar coorperativas</Button>
    </Form>
    </Container>
  )
}