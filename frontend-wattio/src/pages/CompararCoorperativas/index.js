import { useEffect,useContext, useState } from 'react'
import { ContextoCliente } from '@store/ContextoCliente'
import coorperativas from '@services/coorperativas.json'
import Container from 'react-bootstrap/Container';
import Button from 'react-bootstrap/Button';
import ModalContratar from './components/ModalContratar';

export default function CompararCoorperativas(){

  const { pegarDadosCliente } = useContext(ContextoCliente)
  const [carregarCoorperativas, setCarregarCoorperativas] = useState(<></>)
  const dadosCliente = pegarDadosCliente()
  const [mostrarModalContrato, setMostrarModalContrato] = useState({
    mostrar: false
  })

  useEffect(() =>{
    //dadosCliente = {nomeEmpresa: '', valorMensal: '', tipoCliente: ''} 

    const analisarCoorperativas = coorperativas.filter((c) =>{
      const valorMinMax = dadosCliente.valorMensal >= c.valorMinMensal && dadosCliente.valorMensal <= c.valorMaxMensal

      const tipoCliente = dadosCliente.tipoCliente === c.tipoCliente

      if(valorMinMax && tipoCliente){ return c }
    })

    const maiorDesconto = analisarCoorperativas.map(
      (des) => des.desconto
    ).sort((a,b) => b - a)[0]

    const criarComponentes = analisarCoorperativas.map((coor)=>{

      const valorMensalComDesconto = dadosCliente.valorMensal * (1 - coor.desconto)
      const coorMaiorDesconto = coor.desconto === maiorDesconto

      return (
        <div 
          key={coor.id} 
          id={coor.id} 
          className={`border rounded-2 border-2 p-3 ${coorMaiorDesconto ? 'border-warning border-3 order-first' : ''}`}>
          <p>
            <span className='text-warning fw-bold'>Nome: </span>
            {coor.nome}
          </p>
          <p className={`${coorMaiorDesconto ? 'bg-warning':'bg-light'} text-dark fw-bold`}>
            <span>Economia: </span>
            {coor.desconto * 100}%
            </p>
          <p>
            <span className='text-warning fw-bold'>Valor mensal com desconto: </span> 
            R$ {valorMensalComDesconto.toFixed(0)}
            </p>
          <p>
            <span className='text-warning fw-bold'>Valor anual com desconto: </span> R$ {(valorMensalComDesconto * 12).toFixed(0)}
          </p>
          <p>
            <span className='text-warning fw-bold'>Tipo de cliente: </span>
            {coor.tipoCliente}
          </p>
          <Button 
            className='fw-bold w-100' 
            variant={`${coorMaiorDesconto ? 'warning':'light'}`} 
            onClick={() => {
              setMostrarModalContrato({
                mostrar: true,
                coorperativaContratada: coor
              })
            }}>
            Contratar
          </Button>
        </div>
      )
    })

    setCarregarCoorperativas(criarComponentes)
  },[])

  return(
    <Container fluid className='px-0'>
      <div className='d-flex flex-column p-3 text-light' style={{backgroundColor: 'rgba(5, 5, 130, .8)'}}>
        <h2 className='text-warning fw-bold align-self-center'>Dados do cliente</h2>
        <p>
          <span className='text-warning fw-bold'>Nome: </span> 
          {dadosCliente.nomeEmpresa}
        </p>
        <p>
          <span className='text-warning fw-bold'>Valor mensal: </span> 
          R$ {(dadosCliente.valorMensal).toFixed(0)}
        </p>
        <p>
          <span className='text-warning fw-bold'>Valor anual: </span> 
          R$ {(dadosCliente.valorMensal * 12).toFixed(0)}
        </p>
        <p>
          <span className='text-warning fw-bold'>Tipo de cliente: </span> 
          {dadosCliente.tipoCliente}
        </p>
      </div>
      {mostrarModalContrato.mostrar ? 
      <ModalContratar 
        nome={mostrarModalContrato.coorperativaContratada.nome}
        mostrar={mostrarModalContrato.mostrar}
        setMostrar={setMostrarModalContrato}
      />
      :<></>}
      <div className='mt-3 d-flex flex-column text-light py-4 px-0 px-sm-3' style={{backgroundColor: 'rgba(5, 5, 130, .8)'}}>
        <h2 className='text-warning fw-bold align-self-center mb-4'>Coorperativas</h2>
        <div className='d-flex flex-wrap justify-content-around' style={{gap:'15px'}}>
          {carregarCoorperativas}
        </div>
      </div>
    </Container>
  )
}