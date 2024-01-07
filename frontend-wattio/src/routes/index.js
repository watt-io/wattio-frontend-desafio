import { Routes, Route } from 'react-router-dom'
import Home from '@pages/Home'
import CompararCoorperativas from '@pages/CompararCoorperativas'
import NavBa from '@components/NavBa'

export default function Rotas(){
  return(
    <>
      <NavBa/>
      <Routes>
        <Route path='/' element={<Home/>}/>
        <Route path='/compararCoorperativas' element={<CompararCoorperativas/>}/>
      </Routes>
    </>
  )
}