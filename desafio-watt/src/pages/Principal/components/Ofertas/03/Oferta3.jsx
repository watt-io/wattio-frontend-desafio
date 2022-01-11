import React from 'react';
import {
    Container,
    Div,
    DivButton
} from './Styles';

const Oferta3 = () => {
    return (
        <Container>
            <div>
                <h1>Oferta Especial</h1>
            </div>
            <Div>
                <p>Cooperativa: Clean Energy</p>
                <p>Economia: 28,5%</p>
            </Div>
            <DivButton >
                <button>Calcular economia</button>
            </DivButton> 
        </Container>
    )
}

export default Oferta3
