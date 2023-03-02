import React from 'react'
import wattiologo from "../../assets/wattio-logo.png"

import './styles.css'

function Footer() {
  return (
    <div className='footer_container'>
      <div className='logo_container'>
        <img src={wattiologo} alt="WATTIO" />
      </div>
      <div className='signature_container'>
        <strong>Desafio Desenvolvimento Web - WattIo</strong>
        <p>Desenvolvido por Vitor Ramalho Vilela</p>
      </div>
    </div>
  )
}

export default Footer