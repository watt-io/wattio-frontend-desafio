import { BrowserRouter } from 'react-router-dom'
import ContextoClienteProvider from '@store/ContextoCliente'
import Rotas from '@routes'

function App() {
  return (
    <BrowserRouter>
      <ContextoClienteProvider>
        <Rotas/>
      </ContextoClienteProvider>
    </BrowserRouter>
  );
}

export default App;