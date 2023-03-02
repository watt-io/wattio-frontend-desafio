import { useEffect, useState } from 'react'
import './App.css'
import Header from './components/Header'
import Main from './components/Main'
import CooperativeSection from './components/CooperativeSection'
import EconomyResult from './components/EconomyResult'
import Footer from './components/Footer'
import { ICooperative } from './@types/ICooperative'

const cooperativesMock = [
  {
    nome: 'EnerFácil',
    valorMinimoMensal: 1000,
    valorMaximoMensal: 40000,
    desconto: .2,
    isChecked: false,
  },
  {
    nome: 'EnerLimpa',
    valorMinimoMensal: 1000,
    valorMaximoMensal: 80000,
    desconto: .25,
    isChecked: false,
  },
  {
    nome: 'EnerGrande',
    valorMinimoMensal: 40000,
    valorMaximoMensal: 100000,
    desconto: .3,
    isChecked: false,
  }
]



function App() {
  const [averageValue, setAverageValue] = useState<string>("");
  const [cooperatives, setCooperatives] = useState<ICooperative[]>([]);
  const [economyResult, setEconomyResult] = useState();

  const [filterAvailableCooperatives, setFilterAvailableCooperatives] = useState<ICooperative[]>([]);
  const [selectedCooperative, setSelectedCooperative] = useState<ICooperative | undefined>({} as ICooperative);

  useEffect(() => {
    setCooperatives(cooperativesMock)
  },[])
  return (
    <>
      <Header />
      <Main
        averageValue={averageValue}
        setAverageValue={setAverageValue}
      />
      <CooperativeSection
        averageValue={averageValue}
        filterAvailableCooperatives={filterAvailableCooperatives} 
        setFilterAvailableCooperatives={setFilterAvailableCooperatives}
        selectedCooperative={selectedCooperative}
        setSelectedCooperative={setSelectedCooperative}
        cooperatives={cooperatives}
        economyResult={economyResult}
        setEconomyResult={setEconomyResult}
      />
      <EconomyResult
        averageValue={averageValue}
        selectedCooperative={selectedCooperative}
        setSelectedCooperative={setSelectedCooperative}
        economyResult={economyResult}
      />
      <Footer />
    </>
  )
}

export default App
