import { createGlobalStyle } from 'styled-components'

export const GlobalStyle = createGlobalStyle`
    *{
        margin: 0;
        padding: 0;
        box-sizing: 0;
    }

    :focus {
        outline: 0;
        box-shadow: 0 0 0 2px ${(props) => props.theme['red-500']};
    }

    body{
        background: ${(props) => props.theme['blue-primary']};
        color: ${(props) => props.theme['gray-300']};
        --webkit-font-smoothing: antialiased;
    }

    body, input, button{
        font-family: 'Roboto', sans-serif;
        font-weight: 400;
        font-size: 1rem;
    }
`