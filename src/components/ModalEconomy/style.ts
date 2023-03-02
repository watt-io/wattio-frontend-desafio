import styled from "styled-components";
import { DialogContent } from "@mui/material";
import { Link } from "react-router-dom";

const StyledDialogContent = styled(DialogContent)`
  display: flex;
  flex-direction: column;
  gap: 1rem;
`;

const StyledLinkMui = styled(Link)`
  cursor: pointer;
  font-weight: 500;
  font-size: 0.875rem;
  line-height: 1.75;
  letter-spacing: 0.02857em;
  text-transform: uppercase;
  min-width: 64px;
  padding: 6px 8px;
  border-radius: 4px;
  color: #1976d2;

  :hover {
    background-color: rgb(25, 118, 210, 0.01);
  }
`;

export { StyledDialogContent, StyledLinkMui };
