import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  preview: {
    host: true,                 // escuta em 0.0.0.0
    port: 4173,
    allowedHosts: ['matheusdasilvagastaldi.app.devops-satc.online'],
  },
  plugins: [
    react(),
    {
      name: 'health-check',
      configurePreviewServer(server) {
        server.middlewares.use('/health', (_req, res) => {
          res.setHeader('Content-Type', 'application/json')
          res.end(JSON.stringify({
            status: 'ok',
            service: 'app-satc',
            timestamp: new Date().toISOString()
          }))
        })
      }
    }
  ],
})
