import { useState } from 'react'
import './App.css'
import PanelControl from './components/PanelControl'
import Casilla from './components/Casilla'
import Tablero from './components/Tablero'


function App() {

  return (
    <div className="h-screen bg-neutral-900 flex flex-wrap justify-center gap-12 items-center">
     <PanelControl />
     <Tablero /> 
     
    </div>
  )
}

export default App
