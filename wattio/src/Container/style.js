import styled from 'styled-components'

export const MainContainer = styled.form`
  margin-top: 2rem;
  flex: 1;

  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
`
export const Title = styled.h3`
  font-size: 2rem;
`
export const Description = styled.p`
  margin-top: 1rem;
  font-size: 1.8rem;
  color: ${(props) => props.theme['gray-100']};
`

export const Input = styled.input`
  margin-top: 3rem;
  width: 20rem;
  height: 3rem;
  color: ${(props) => props.theme['red-500']};
  font-size: 2.5rem;
  border-radius: 8px;
  text-align: center;
`
export const InputDescription = styled.p`
  font-size: 1rem;
  color: ${(props) => props.theme['gray-300']};
  margin-top: .4rem;
  margin-bottom: .4rem;
`

export const CalculateButton = styled.button`
  width: 50%;
  border: 0;
  padding: 1rem;
  border-radius: 8px;
  margin-top: 3rem;

  display: flex;
  justify-content: center;
  align-items: center;

  font-weight: bold;
  font-size: 2rem;

  color: ${(props) => props.theme['green-500']};

  cursor: pointer;

  &:disabled {
    cursor: not-allowed;
    opacity: 0.7;
  }
  &:hover{
    background-color: ${(props) => props.theme['green-500']};
    color: ${(props) => props.theme['gray-100']};
  }
`

export const OffersDiv= styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  margin-top: 2rem;
`

export const UlOffers = styled.ul`
  list-style-type: none;
  margin: 1rem 0;
  cursor: pointer;
`
export const LiOffers = styled.li`
  background-color: ${(props) => props.theme['green-500']};
  padding: 1.5rem;
  font-size: 1.6rem;
  margin: 1rem 0;

  display: flex;
  align-items: center;
`
export const LabelOffers = styled.label`
  font-weight: bold;
  color: ${(props) => props.theme['white']};
  cursor: pointer;
`

export const SelectedOfferDiv = styled.div`
  display: flex;
  flex-direction: column;
`

export const SelectedOfferP = styled.p`
  font-size: 1.6rem;
  margin: 1rem 0;
`

export const EconomyButton = styled(CalculateButton)`
  margin-top: 0;
  width: 40rem;
`
export const EconomyParagraph = styled.p`
  color: ${(props) => props.theme['gray-100']};
  font-size: 1.6rem;
  display: block;

  padding: 2rem;
  background-color: ${(props) => props.theme['green-500']};
  margin: 1rem 0;
  font-weight: bold;
`

export const BaseCountdownButton = styled.button`
  width: 100%;
  border: 0;
  padding: 1rem;
  border-radius: 8px;

  display: flex;
  justify-content: center;
  align-items: center;

  gap: 0.5rem;
  font-weight: bold;

  color: ${(props) => props.theme['gray-100']};

  cursor: pointer;

  &:disabled {
    cursor: not-allowed;
    opacity: 0.7;
  }
`
export const StartCountdownButton = styled(BaseCountdownButton)`
  background: ${(props) => props.theme['green-500']};

  &:not(:disabled):hover {
    background: ${(props) => props.theme['green-700']};
  }
`

export const StopCountdownButton = styled(BaseCountdownButton)`
  background: ${(props) => props.theme['red-500']};

  &:not(:disabled):hover {
    background: ${(props) => props.theme['red-700']};
  }
`