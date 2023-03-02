import React, { useState } from 'react'
import { ICooperative } from '../../@types/ICooperative'

import './styles.css'

interface CooperativeCardProps {
  cooperative: ICooperative
  selectedCooperative: ICooperative | undefined
  setSelectedCooperative: (value: ICooperative | undefined) => void;
  isChecked: boolean,
  setIsChecked: (value: boolean) => void;
}

const CooperativeCard = ({ cooperative, selectedCooperative, setSelectedCooperative, isChecked, setIsChecked }: CooperativeCardProps) => {
  console.log('cooperativa selecionada', selectedCooperative)


  return (
    <div className='cooperative_card'>
      <label className='cooperative_check'>
        <input
          type="checkbox"
          checked={isChecked}
          onChange={() => (
            !isChecked ? (
              setSelectedCooperative(cooperative)
            ) : (
              setSelectedCooperative(undefined)
            ),
            setIsChecked(!isChecked)
          )
          }
        />
        <span></span>
        Oferta
      </label>
      <p><strong>Cooperativa: </strong> {cooperative.nome}</p>
      <p><strong>Economia: </strong> {cooperative.desconto * 100}%</p>
    </div>
  )
}

export default CooperativeCard