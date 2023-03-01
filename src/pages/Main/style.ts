import styled from "styled-components";

const StyledMainContainer = styled.main`
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 2rem;
  height: 100vh;
  padding: 0 1rem;
  background: linear-gradient(
    45deg,
    var(--color-primary) 0,
    var(--color-negative) 110%
  );
`;

const StyledLogo = styled.header`
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 1rem;

  img {
    width: 90px;
  }

  div {
    align-self: flex-end;
    max-width: 100px;
  }
`;

const StyledMainIntern = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  max-width: 490px;
  width: 100%;
  padding: 2rem;
  border-radius: 6px;
  background-color: var(--color-white);
`;

export { StyledMainContainer, StyledMainIntern, StyledLogo };
