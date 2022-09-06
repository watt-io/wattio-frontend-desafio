import { createContext } from "react";
import { useNavigate } from 'react-router-dom'

export const ContextoCliente = createContext()

export default function ContextoClienteProvider({children}){

  const values = {
    goToPage: useNavigate(),
    salvarDadosCliente(data){
      localStorage.setItem('dadosCliente', JSON.stringify(data))
    },
    pegarDadosCliente(){return JSON.parse(localStorage.getItem('dadosCliente'))}
  }

  return(
    <ContextoCliente.Provider value = {values}>
      {children}
    </ContextoCliente.Provider>
  )
}