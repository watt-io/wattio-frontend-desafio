import { Link } from "react-router-dom";
import styled from "styled-components";

const StyledLink = styled(Link)`
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
  background-color: var(--color-blue-1);
  padding: 1rem;
  border-radius: 25px;

  svg {
    color: white;
  }
`;

const StyledNavigationLink = styled(Link)`
  position: absolute;
  left: 15px;
  top: 15px;
`;

const StyledNavigationHomeLink = styled(Link)`
  position: absolute;
  right: 15px;
  top: 15px;
`;

export { StyledLink, StyledNavigationLink, StyledNavigationHomeLink };
