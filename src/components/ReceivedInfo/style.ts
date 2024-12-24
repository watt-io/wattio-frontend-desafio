import styled from "styled-components";

const StyledReceivedInfo = styled.section`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 2rem;
  animation: fadeIn;
  animation-duration: 0.4s;

  .received__info--header,
  .received__info--card {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 2rem;
  }

  form {
    display: flex;
    flex-direction: column;
    width: 100%;
    gap: 2rem;

    a {
      align-self: center;
    }
  }

  @media (max-width: 425px) {
    .received__info--card {
      flex-wrap: wrap;
    }
  }
`;

export { StyledReceivedInfo };
