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
    <main>
      <Container fluid className='px-0 text-justify d-flex justify-content-center' style={{backgroundColor: 'rgba(5, 5, 130, .8)'}}>
        <Container className='px-0 m-0'>
          <div className='text-light p-2 px-sm-4'>
            <div className='d-flex flex-column mt-3'>
              <h1 className='align-self-center'>O que são <span className='text-warning'>Coorperativas de Energia</span> ?</h1>
              <p>
                No Brasil já é possível gerar a própria energia, deixando de comprar das distribuidoras tradicionais como CEMIG, Energia, CPFL, etc.
              </p>
              <p>
                Quem gera a própria energia economiza nas contas de sua casa/empresa mensalmente.
              </p>
              <p>
                Apesar da popularização das placas de energia solar, ainda são poucos os que podem instalar um sistema em sua casa e usufruir da economia e outros benefícios que isso pode trazer.
              </p>
              <p>
                <span className='text-warning fw-bold'>
                  E se houvesse uma maneira de as pessoas comprarem energia de usinas na sua região a um preço menor do que o da distribuidora tradicional?
                </span>
              </p>
              <p>
              <span className='text-warning fw-bold'>Já existe uma maneira:</span> através das <span className='text-warning fw-bold'>Cooperativas de Energia.</span></p>
              <p>
                As <span className='text-warning fw-bold'>Cooperativas de Energia.</span> são empresas que compram energia excedente de usinas e outras casas/empresas com sistemas de geração; e vendem para consumidores a <span className='text-warning fw-bold'>preços mais baixos</span> que os das distribuidoras tradicionais.
              </p>
              <p>
                Porém como este é um mercado muito novo, os consumidores ainda não possuem muita informação a respeito de quem são as empresas que se denominam <span className='text-warning fw-bold'>Cooperativas de Energia</span> e o que elas fazem.
              </p>
              <p>É ai que entramos !</p>
              <p>
                A <span className='text-warning fw-bold'>Marketplace de Energia</span> surgiu com o objetivo de criar a ponte entre clientes e coorperativas de energias, dessa maneira o cliente só se preocupa em localizar a coorperativa que atende as suas necessidades e o processo de contratação fica sobre nossa responsabilidade.
              </p>
            </div>
            <div className='d-flex flex-column mt-3'>
              <h2 className='align-self-center'>Como usar a <span className='text-warning'>Marketplace de Energia</span> ?</h2>
              <div className='d-flex flex-column'>
                <p>Basta preencher seus dados corretamente nos campos abaixo, dessa maneira será feito a busca de coorperativas cadastradas na plataforma <span className='text-warning fw-bold'>"Marketplace de Energia"</span>.</p>
                <p>Finalizado a busca você será redirecionado para uma nova página que mostrará quais coorperativas corresponderam com suas necessidades.</p>
                <p>
                  Gostando de uma coorperativa basta efetuar a contratação.
                </p>
              </div>
            </div>
          </div>
        </Container>
      </Container>
      <Container className='mb-4'>
        <Form className="mt-3 p-3 rounded-3" onSubmit={handleSubmit(procurarCoorperativas)} style={{backgroundColor: 'rgba(5, 5, 130, .8)'}}>
        <Form.Group className="mb-3" controlId="formBasicEmpresa">
          <Form.Label className='text-light'>*Nome/Empresa</Form.Label>
          <Form.Control type="text" {...register('nomeEmpresa')}/>
          <Form.Text className="text-muted">
            <p className='m-0 mt-1 text-danger fw-bold fs-6'>{errors.nomeEmpresa?.message}</p>
          </Form.Text>
        </Form.Group>
        <Form.Group className="mb-3" controlId="formBasicValorMensal">
        <Form.Label className='text-light'>*Valor médio mensal de energia da minha casa/empresa</Form.Label>
        <InputGroup>
          <InputGroup.Text id="valorMensal">R$</InputGroup.Text>
          <Form.Control {...register('valorMensal')} type="number" aria-label="valorMensal" aria-describedby="valorMensal"/>
        </InputGroup>
        <Form.Text className="text-muted">
          <p className='m-0 mt-1 text-danger fw-bold fs-6'>{errors.valorMensal?.message}</p>
        </Form.Text>
        </Form.Group>
        <Form.Group>
          <Form.Label className='me-3 text-light'>*Tipo de cliente:</Form.Label>
          <Form.Select aria-label="Tipo de cliente" {...register('tipoCliente')}>
            <option value="PF">PF</option>
            <option value="PJ">PJ</option>
          </Form.Select>
        </Form.Group>
        <Button variant="warning" type="submit" className="mt-3">Procurar coorperativas</Button>
        </Form>
      </Container>
    </main>
  )
}