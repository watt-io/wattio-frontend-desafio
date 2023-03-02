import styled from "styled-components";

const StyledMainContainer = styled.main`
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 2rem;
  padding: 2rem 0.8rem;
`;

const StyledLogo = styled.header`
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 1rem;

  img {
    width: 90px;
    filter: brightness(120%);
  }

  div {
    align-self: flex-end;
    max-width: 100px;
  }
`;

const StyledMainIntern = styled.div`
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  max-width: 840px;
  width: 100%;
  padding: 2rem;
  border-radius: 6px;
  background-color: var(--color-white);
`;

export { StyledMainContainer, StyledMainIntern, StyledLogo };
