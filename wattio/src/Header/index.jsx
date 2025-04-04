import * as S from './style.js'
import Logo from '../assets/Logo.svg'

function Header(){
    return(
        <S.Header>
            <img src={Logo} alt="Logotipo da WATTio" />
            <S.Title>WATTio</S.Title>
            <S.SpaceHeader>
                <S.Description>Driving the future of energy</S.Description>
            </S.SpaceHeader>
        </S.Header>
    )
}

export default Header