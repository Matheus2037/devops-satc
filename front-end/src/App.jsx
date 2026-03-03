import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import Home from './Home';
import Sobre from './Sobre';
import Contato from './Contato';
import './App.css'; // Pode usar o CSS padrão do Vite

function App() {
  return (
    <BrowserRouter>
      <nav style={{ padding: '1rem', borderBottom: '1px solid #ccc' }}>
        <Link to="/" style={{ marginRight: '10px' }}>Home</Link> | 
        <Link to="/sobre" style={{ margin: '0 10px' }}>Sobre</Link> | 
        <Link to="/contato" style={{ marginLeft: '10px' }}>Contato</Link>
      </nav>

      <div style={{ padding: '2rem' }}>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/sobre" element={<Sobre />} />
          <Route path="/contato" element={<Contato />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;