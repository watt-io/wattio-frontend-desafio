import React, { useState } from 'react';
import ImagePng from './img/icone-pi.png'
import Oferta1 from './components/Ofertas/01/Oferta1'
import Oferta2 from './components/Ofertas/02/Oferta2'
import Oferta3 from './components/Ofertas/03/Oferta3'
import Oferta4 from './components/Ofertas/04/Oferta4'
import Oferta5 from './components/Ofertas/05/Oferta5'
import {
    Container,
    DivImg,
    ContainerTextos,
    Titulo1,
    Titulo2,
    Titulo3, 
    Calculador1,
    DivSpan,
    DivInput,
    DivButton,
    DivOfertas
} from './Styles';

const PaginaInicial = () => {
    const [inputValue, setInputValue] = useState(50);
    const [isLoggedIn, setIsLoggedIn] = useState(false);

    const handleInputChange = (e) => {
        setInputValue(e.target.value); 
      }

    const onclickState = () => {
        if (!isLoggedIn) {
            setIsLoggedIn(true)
         } else {
            setIsLoggedIn(false)
         }  
    }

    return (
            <Container>
                <ContainerTextos>
                    <Titulo1>
                        <h1>Calcule a <br/> <span>economia</span> <br/>para sua empresa</h1>
                    </Titulo1> 
                    <Titulo2>
                        <p>Veja as ofertas que temos para você!</p>
                    </Titulo2>
                    <Titulo3>
                        <p>Qual o valor médio <br/>mensal da sua energia?</p>
                    </Titulo3>
                    <Calculador1>
                        <DivSpan>
                            <span>R$ {inputValue}</span>
                        </DivSpan>
                        <DivInput>
                            <input 
                            onChange={handleInputChange}
                            value={inputValue} 
                            type="range" 
                            min="0" 
                            max="10000" 
                            step="1.5" 
                            list="tickmarks"/>   
                        </DivInput>
                        <DivButton >
                            <button onClick={()=>onclickState()}>Encontrar ofertas</button>
                        </DivButton>               
                    </Calculador1>
                    <DivOfertas>            
                        {isLoggedIn && inputValue > 100 && inputValue < 700? <Oferta1 /> : null}
                        {isLoggedIn && inputValue > 700 && inputValue < 2000 ? <Oferta2 /> : null}
                        {isLoggedIn && inputValue > 2000 && inputValue < 7600 ? <Oferta3 /> : null}
                        {isLoggedIn && inputValue > 4000 && inputValue < 8000 ? <Oferta4 /> : null}
                        {isLoggedIn && inputValue > 7000 && inputValue < 9950 ? <Oferta5 /> : null}
                   </DivOfertas>
                </ContainerTextos>
                <DivImg>
                    <img src={ImagePng} alt={'figura-png'}></img>
                </DivImg>
            </Container>
    )
}

export default PaginaInicial