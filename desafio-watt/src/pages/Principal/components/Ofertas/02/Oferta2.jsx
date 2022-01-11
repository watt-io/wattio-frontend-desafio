import React from 'react';
import {
    Container,
    Div,
    DivButton
} from './Styles';

const Oferta2 = () => {
    return (
        <Container>
            <div>
                <h1>Oferta Especial</h1>
            </div>
            <Div>
                <p>Cooperativa: EnerUp</p>
                <p>Economia: 25%</p>
            </Div>
            <DivButton >
                <button>Calcular economia</button>
            </DivButton> 
        </Container>
    )
}

export default Oferta2
