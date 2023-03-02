import React, {useState} from'react'
import { money_mask } from '../../utils/money_mask';
import './styles.css'

interface IMainProps{
  averageValue: string,
  setAverageValue: (value: string ) => void;
}

const Main = ({averageValue, setAverageValue}: IMainProps) => {

  return (
    <div className='main_container'>
      <div className='main_describe'>
        <h1>Calcule a economia na conta de energia em empresa.</h1>
        <p>Cooperativas de energia solar são organizações formadas por um grupo de pessoas que se unem para produzir energia solar de forma colaborativa e compartilhada. Os membros contribuem financeiramente para instalar painéis solares em um local compartilhado e a energia gerada é distribuída entre os membros ou vendida para a rede elétrica. As cooperativas permitem reduzir custos de instalação, democratizar o acesso à energia renovável e promover a sustentabilidade ambiental.</p>
      </div>
      <div className='main_calculator'>
        <p>Informe o valor médio mensal de sua conta de energia:</p>
        <div className='main_calculator_input'>
          <label htmlFor="">R$</label>
          <input 
            type="text" 
            placeholder='0,00'
            onChange={(e) => setAverageValue(money_mask(e.target.value))}
            value={averageValue}
          />
        </div>
        {/* <button>Buscar ofertas!</button> */}
      </div>
    </div>
  )
}

export default Main