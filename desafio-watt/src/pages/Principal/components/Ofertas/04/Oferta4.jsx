import React from 'react';
import {
    Container,
    Div,
    DivButton
} from './Styles';

const Oferta4 = () => {
    return (
        <Container>
            <div>
                <h1>Oferta Especial</h1>
            </div>
            <Div>
                <p>Cooperativa: Total Energy</p>
                <p>Economia: 34%</p>
            </Div>
            <DivButton >
                <button>Calcular economia</button>
            </DivButton> 
        </Container>
    )
}

export default Oferta4
