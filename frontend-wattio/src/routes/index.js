import { Routes, Route } from 'react-router-dom'
import Home from '@pages/Home'
import CompararCoorperativas from '@pages/CompararCoorperativas'

export default function Rotas(){
  return(
    <Routes>
      <Route path='/' element={<Home/>}/>
      <Route path='/compararCoorperativas' element={<CompararCoorperativas/>}/>
    </Routes>
  )
}