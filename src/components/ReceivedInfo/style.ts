import styled from "styled-components";

const StyledReceivedInfo = styled.section`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  gap: 2rem;

  div {
    width: 75%;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 2rem;
  }

  form {
    display: flex;
    flex-direction: column;

    :nth-child(2) {
      align-items: center;
    }

    gap: 2rem;
  }
`;

export { StyledReceivedInfo };
