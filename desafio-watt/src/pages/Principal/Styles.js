import styled from "styled-components";

export const Container = styled.div `
    h1, h2, p{
        color: white;
    }
    display: flex;
    justify-content: center;
    align-items: center;

`
export const DivImg = styled.div `
        img{
            width: 50vw;
            height: 80vh;
            background: url(Power Icon Black.I02.png);
            mix-blend-mode: overlay;
        }
`

export const ContainerTextos = styled.div `
    width: 50%;
    height: 100%;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-direction: column;
`

export const Titulo1 = styled.div `
    font-size: 1.4em;
    margin-top: 14vh;
    margin-left: 30vw;
    width: 90%;
        span{
            color: #FBFF34;
            }
`

export const Titulo2 = styled.div `
    font-size: 1.2em;
    margin-top: 3vh;
    margin-left: 30vw;
    width: 90%;
`

export const Titulo3 = styled.div `
    font-size: 1.2em;
    margin-top: 12vh;
    margin-left: 30vw;
    width: 90%;
    font-weight: bold;
`

export const Calculador1 = styled.div `
    font-size: 1.4em;
    margin-top: 1vh;
    margin-left: 30vw;
    width: 90%;
`

export const DivSpan = styled.div `
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 2vh;
    font-size: 1.4em;
    width: 18vw;
    height: 8vh;
    text-align: center;
    background-color: white;
    border-radius: 8px;
        span{
            color: red;
        }
`

export const DivInput = styled.div `
    font-size: 1.4em;
    margin-top: 1vh;
    width: 90%;
    input[type=range] {
    /*removes default webkit styles*/
    -webkit-appearance: none;
    
    /*fix for FF unable to apply focus style bug */
    border: 1px solid white;
    
    /*required for proper track sizing in FF*/
    width: 300px;
    }
    input[type=range]::-webkit-slider-runnable-track {
        width: 300px;
        height: 5px;
        background: #ddd;
        border: none;
        border-radius: 3px;
    }
    input[type=range]::-webkit-slider-thumb {
        -webkit-appearance: none;
        border: none;
        height: 16px;
        width: 16px;
        border-radius: 50%;
        background: #FBFF34; /*Aqui altera a cor do cursor*/
        margin-top: -4px;
    }
    input[type=range]:focus {
        outline: none;
    }
    input[type=range]:focus::-webkit-slider-runnable-track {
        background: #ccc;
    }

    input[type=range]::-moz-range-track {
        width: 300px;
        height: 5px;
        background: #ddd;
        border: none;
        border-radius: 3px;
    }
    input[type=range]::-moz-range-thumb {
        border: none;
        height: 16px;
        width: 16px;
        border-radius: 50%;
        background: goldenrod;
    }

    /*hide the outline behind the border*/
    input[type=range]:-moz-focusring{
        outline: 1px solid white;
        outline-offset: -1px;
    }

    input[type=range]::-ms-track {
        width: 300px;
        height: 5px;
        
        /*remove bg colour from the track, we'll use ms-fill-lower and ms-fill-upper instead */
        background: transparent;
        
        /*leave room for the larger thumb to overflow with a transparent border */
        border-color: transparent;
        border-width: 6px 0;

        /*remove default tick marks*/
        color: transparent;
    }
    input[type=range]::-ms-fill-lower {
        background: #777;
        border-radius: 10px;
    }
    input[type=range]::-ms-fill-upper {
        background: #ddd;
        border-radius: 10px;
    }
    input[type=range]::-ms-thumb {
        border: none;
        height: 16px;
        width: 16px;
        border-radius: 50%;
        background: goldenrod;
    }
    input[type=range]:focus::-ms-fill-lower {
        background: #888;
    }
    input[type=range]:focus::-ms-fill-upper {
        background: #ccc;
    }
`
export const DivButton = styled.div `
        margin-top: 3vh;
        width: 90%;
            button{
                border-radius: 6px;
                font-size: 0.7em;
                font-weight: bold;
                width: 18vw;
                height: 7vh;
                background-color: red;
                color: white;
            :hover{
                background-color: white;
                color: red;
            }}
`

export const DivOfertas = styled.div `
    margin-left: 35vw;
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    flex-direction: column;
    font-size: 1.2em;        
    width: 100%;
    margin-top: 3vh;
`
