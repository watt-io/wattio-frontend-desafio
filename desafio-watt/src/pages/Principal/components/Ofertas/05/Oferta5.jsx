import React from 'react';
import {
    Container,
    Div,
    DivButton
} from './Styles';

const Oferta5 = () => {
    return (
        <Container>
            <div>
                <h1>Oferta Especial</h1>
            </div>
            <Div>
                <p>Cooperativa: Top Sun</p>
                <p>Economia: 43%</p>
            </Div>
            <DivButton >
                <button>Calcular economia</button>
            </DivButton> 
        </Container>
    )
}

export default Oferta5
