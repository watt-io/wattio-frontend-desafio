import { ThemeProvider } from 'styled-components'
import { defaultTheme } from './styles/themes/default'
import { GlobalStyle } from './styles/global'
import Container from './Container'
import Header from './Header'

function App() {

  return (
    <ThemeProvider theme={defaultTheme}>
      <GlobalStyle/>
      <Header/>
      <Container/>
    </ThemeProvider>
  )
}

export default App
