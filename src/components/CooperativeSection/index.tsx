import React, { useEffect, useState } from 'react';
import { ICooperative } from '../../@types/ICooperative';
import { price_to_number } from '../../utils/price_to_number';
import CooperativeCard from '../CooperativeCard';

import './styles.css'

interface CooperativeSectionProps {
  averageValue: string,
  filterAvailableCooperatives: ICooperative[],
  setFilterAvailableCooperatives: (value: ICooperative[]) => void,
  cooperatives: ICooperative[],
  selectedCooperative: ICooperative | undefined,
  setSelectedCooperative: (value: ICooperative | undefined) => void,
  economyResult: any,
  setEconomyResult: any
}

const CooperativeSection = ({
  averageValue,
  filterAvailableCooperatives,
  setFilterAvailableCooperatives,
  cooperatives,
  selectedCooperative,
  setSelectedCooperative,
  economyResult,
  setEconomyResult,
}: CooperativeSectionProps) => {

  const [isChecked, setIsChecked] = useState(false);

  function calculateEconomy(){
    if(selectedCooperative){
      setEconomyResult(price_to_number(averageValue) * selectedCooperative?.desconto)
    }
  }

  useEffect(() => {
    setFilterAvailableCooperatives(
      cooperatives.filter((cooperative) => cooperative.valorMinimoMensal <= price_to_number(averageValue) && cooperative.valorMaximoMensal >= price_to_number(averageValue))
    )
  }, [averageValue])
  useEffect(() => {
    console.log('resultado', economyResult)
  },[economyResult])
  return (
    <div className='cooperative_container'>
      <div className='cooperative_section'>
        <p>Selecione a cooperativa</p>
        <div className='cooperative_item_container'>
          {
            filterAvailableCooperatives ? (
              filterAvailableCooperatives.map((cooperative) => (
                <CooperativeCard
                  key={cooperative.nome}
                  cooperative={cooperative}
                  selectedCooperative={selectedCooperative}
                  setSelectedCooperative={setSelectedCooperative}
                  isChecked={isChecked}
                  setIsChecked={setIsChecked}
                />
              ))
            ) : (<p>Não há ofertas para esse valor médio</p>)
          }
        </div>
        <button
          onClick={calculateEconomy}
        >
          Calcular Economia
        </button>
      </div>
    </div>
  )
}

export default CooperativeSection