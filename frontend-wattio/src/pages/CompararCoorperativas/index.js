import { useEffect,useContext, useState } from 'react'
import { ContextoCliente } from '@store/ContextoCliente'
import coorperativas from '@services/coorperativas.json'
import Container from 'react-bootstrap/Container';

export default function CompararCoorperativas(){

  const { pegarDadosCliente } = useContext(ContextoCliente)
  const [carregarCoorperativas, setCarregarCoorperativas] = useState(<></>)
  const dadosCliente = pegarDadosCliente()

  useEffect(() =>{
    //dadosCliente = {nomeEmpresa: '', valorMensal: '', tipoCliente: ''} 

    const analisarCoorperativas = coorperativas.filter((dc) =>{
      if((dadosCliente.valorMensal >= dc.valorMinMensal && dadosCliente.valorMensal <= dc.valorMaxMensal) && (dadosCliente.tipoCliente === dc.tipoCliente)){
        return dc
      }
    })

    const maiorDesconto = analisarCoorperativas.map((des) =>{
      return des.desconto
    }).sort().reverse()[0]

    const criarComponentes = analisarCoorperativas.map((coor)=>{
      return (
        <div key={coor.id} id={coor.id} className={`border ms-2 ${coor.desconto === maiorDesconto ? 'border-primary order-first' : ''}`}>
          <p>Nome: {coor.nome}</p>
          <p>Desconto: {coor.desconto * 100}%</p>
          <p>Valor mensal com desconto: {dadosCliente.valorMensal * (1 - coor.desconto)}</p>
          <p>Valor anual com desconto: {(dadosCliente.valorMensal * (1 - coor.desconto)) * 12}</p>
          <p>Tipo cliente: {coor.tipoCliente}</p>
        </div>
      )
    })

    setCarregarCoorperativas(criarComponentes)
  },[])

  return(
    <Container>
      <div>
        <h2>Dados do cliente</h2>
        <p>Nome: {dadosCliente.nomeEmpresa}</p>
        <p>Valor mensal: R${dadosCliente.valorMensal}</p>
        <p>Valor anual: R${dadosCliente.valorMensal * 12}</p>
        <p>Tipo cliente: {dadosCliente.tipoCliente}</p>
      </div>
      <h2>Coorperativas</h2>
      <div className='d-flex'>
        {carregarCoorperativas}
      </div>
    </Container>
  )
}