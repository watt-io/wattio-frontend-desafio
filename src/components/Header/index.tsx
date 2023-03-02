import React from 'react'
import {BsCashCoin} from 'react-icons/bs';
import './styles.css'

const Header: React.FC = () => {
  return (
    <>
      <div className='header_container'>
          <div className='header_items'>
            <BsCashCoin size={50} />
            <h1>Marketplace de Energia</h1>
          </div>
      </div>
    </>
  )
}

export default Header