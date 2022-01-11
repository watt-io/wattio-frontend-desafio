import styled from "styled-components";

export const Container = styled.div`
    display:flex;
    align-items:center;
    justify-content:center;
    flex-direction:column;
    text-align: center;
    border: 2px solid #FFFFFF;
    border-radius: 6px;
    width: 45%;
    height: 27vh;
        h1{
            font-size: 1em;
            font-weight: bold;
            margin-left: 0.50vw;
        }
`

export const Div = styled.div`
    margin-top: 0.50vw;
    p{
        color: #FFFFFF;
        }
`

export const DivButton = styled.div `
        margin-top: 3vh;
        width: 90%;
            button{
                border-radius: 6px;
                font-size: 1em;
                font-weight: bold;
                width: 18vw;
                height: 7vh;
                background-color: white;
                color: green;
            :hover{
                background-color: white;
                color: red;
            }}
`
