import React, { useState } from 'react';
import {
    ContainerPrincipal,
    ContainerSecundario,
    Div,
    DivButton,
    Resultado
} from './Styles';

const Oferta1 = () => {

    return (
        <ContainerPrincipal>
            <ContainerSecundario>
                <div>
                    <h1>Oferta Especial</h1>
                </div>
                <Div>
                    <p>Cooperativa: EnerLimpa</p>
                    <p>Economia: 10%</p>
                </Div>
                <DivButton >
                    <button>Calcular economia</button>
                </DivButton>
            </ContainerSecundario>
            <Resultado>
            </Resultado> 
        </ContainerPrincipal>
    )
}

export default Oferta1
