import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@design-system': resolve(__dirname, '..', 'design-system')
    }
  },
  server: {
    fs: {
      allow: ['..']
    }
  },
  test: {
    environment: 'jsdom'
  }
})
