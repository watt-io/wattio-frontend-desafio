import styled from 'styled-components'

export const Header = styled.header`
    display: flex;
    align-items: center;
    margin-left: 5rem;
    margin-top: 1rem;
`
export const Title = styled.h2`
    color: ${(props) => props.theme['yellow-primary']};
    font-size: 2rem;
`

export const SpaceHeader = styled.div`
    display: flex;
    flex-grow: 1;
    justify-content: flex-end;
    margin-right: 5rem;
`

export const Description = styled.p`
    color: ${(props) => props.theme['green-300']};
    font-size: 1.6rem;
    font-weight: bold;
`