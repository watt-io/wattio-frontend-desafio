import styled, { css } from "styled-components";

const StyledOptionsCard = styled.button`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 1.5rem;
  padding: 5px;
  box-shadow: 1px 1px 1px 2px var(--color-grey-4);
  width: 100%;
  border-radius: 8px;
  opacity: 0.7;
  transition: all 0.25s;

  p {
    max-width: 90px;
  }

  ${({ colorized }: { colorized?: boolean }) => {
    if (colorized) {
      return css`
        box-shadow: 1px 1px 1px 2px var(--color-blue-1);
        opacity: 1;
      `;
    }
  }}
`;

export default StyledOptionsCard;
