import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Container from 'react-bootstrap/Container';
import InputGroup from 'react-bootstrap/InputGroup';

export default function Home(){

  return(
    <Container>
      <Form className="mt-4">
      <Form.Group className="mb-3" controlId="formBasicEmpresa">
        <Form.Label>Nome/Empresa</Form.Label>
        <Form.Control type="text"/>
        <Form.Text className="text-muted">
          
        </Form.Text>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicValorMensal">
      <Form.Label>Valor médio mensal de energia da minha casa/empresa</Form.Label>
      <InputGroup className="mb-3">
        <InputGroup.Text id="valorMensal">R$</InputGroup.Text>
        <Form.Control type="number" aria-label="valorMensal" aria-describedby="valorMensal"/>
      </InputGroup>
      </Form.Group>

      <Form.Group>
        <Form.Label className='me-3'>Tipo de cliente:</Form.Label>
        <Form.Check
          inline
          label="PF"
          name="tipoCliente"
          type="radio"
          id="inline-radio-1"
        />
        <Form.Check
          inline
          label="PJ"
          name="tipoCliente"
          type="radio"
          id="inline-radio-2"
        />
      </Form.Group>
      <Button variant="primary" type="submit" className="mt-3">Procurar coorperativas</Button>
    </Form>
    </Container>
  )
}