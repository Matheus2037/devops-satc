import { useState } from 'react';

function Contato() {
  const [email, setEmail] = useState('');

  return (
    <div>
      <h1>📞 Contato</h1>
      <p>Entre em contato conosco.</p>
      <input 
        type="email" 
        placeholder="Seu email" 
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        style={{ padding: '8px', marginRight: '10px' }}
      />
      <button>Enviar</button>
    </div>
  );
}

export default Contato;