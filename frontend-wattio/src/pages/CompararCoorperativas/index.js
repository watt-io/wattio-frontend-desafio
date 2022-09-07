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

      return (
        <div key={coor.id} id={coor.id} className={`border ms-2 ${coor.desconto === maiorDesconto ? 'border-primary order-first' : ''}`}>
          <p>Nome: {coor.nome}</p>
          <p>Desconto: {coor.desconto * 100}%</p>
          <p>Valor mensal com desconto: R$ {valorMensalComDesconto}</p>
          <p>Valor anual com desconto: R$ {valorMensalComDesconto * 12}</p>
          <p>Tipo cliente: {coor.tipoCliente}</p>
          <button onClick={() => console.log(coor)}>Contratar</button>
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
        <p>Valor mensal: R$ {dadosCliente.valorMensal}</p>
        <p>Valor anual: R$ {dadosCliente.valorMensal * 12}</p>
        <p>Tipo cliente: {dadosCliente.tipoCliente}</p>
      </div>
      <h2>Coorperativas</h2>
      <div className='d-flex'>
        {carregarCoorperativas}
      </div>
    </Container>
  )
}