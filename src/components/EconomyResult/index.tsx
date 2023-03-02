import React, { useEffect, useState } from 'react'
import { ICooperative } from '../../@types/ICooperative'
import { money_mask } from '../../utils/money_mask';

import './styles.css'

interface EconomyResultProps {
  averageValue: string,
  selectedCooperative: ICooperative | undefined,
  setSelectedCooperative: (value: ICooperative | undefined) => void;
  economyResult: any
}

const EconomyResult = ({ economyResult, selectedCooperative, setSelectedCooperative, averageValue }: EconomyResultProps) => {

  return (
    <div className='result_container'>
      <div className='economy_container'>
        <div className='economy_value'>
          <p>Sua economia anual será de até</p>
          {
            economyResult ? (
              <h1>{Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(economyResult * 12)}</h1>
            ) : (
              <h1>R$ 20.000,00</h1>
            )
          }

        </div>
        <div className='economy_average'>
          <strong>Em médio
            {
              economyResult ? (
                <strong>
                  {Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(economyResult)}

                </strong>
              ) : (
                <strong> R$ 0,00 </strong>
              )
            }
            por mês*</strong>
          <p>*Essa é apenas uma simulação e não configura garantia do desconto.</p>
          <button>Quero contratar</button>
        </div>
      </div>
    </div>
  )
}

export default EconomyResult