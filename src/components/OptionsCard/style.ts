import styled, { css } from "styled-components";

const StyledOptionsCard = styled.button`
  box-shadow: 1px 1px 10px grey;
  min-width: 130px;
  height: 150px;
  border-radius: 8px;
  opacity: 0.8;

  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 2rem;

  ${({ colorized }: { colorized?: boolean }) => {
    if (colorized) {
      return css`
        box-shadow: 1px 1px 10px var(--color-secondary);
        opacity: 1;
      `;
    }
  }}
`;

export default StyledOptionsCard;
