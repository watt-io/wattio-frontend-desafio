import styled from "styled-components";

const StyledReceivedProposal = styled.section`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 2rem;
  max-width: 526px;
  width: 100%;
  animation: fadeIn;
  animation-duration: 0.4s;

  form {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }
`;

export default StyledReceivedProposal