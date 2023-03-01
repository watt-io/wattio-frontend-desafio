import { Outlet } from "react-router-dom";
import { StyledLogo, StyledMainContainer, StyledMainIntern } from "./style";
import Logo from "../../assets/inowatt-icon.png";
import Text from "../../styles/Typography";

const Main = () => {
  return (
    <StyledMainContainer>
      <StyledLogo>
        <img src={Logo} alt="Inowatt logo" />
        <div>
          <Text fontSize="title3" color="white" tag="h1">
            Inowatt
          </Text>
          <Text fontSize="text4" color="white">
            Inovações em energia.
          </Text>
        </div>
      </StyledLogo>
      <StyledMainIntern>
        <Outlet />
      </StyledMainIntern>
    </StyledMainContainer>
  );
};

export default Main;
