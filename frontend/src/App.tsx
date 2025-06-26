import React, { useEffect } from 'react'
import { Card } from './components/Card'
import { JobFeed } from './components/JobFeed'
import { SideNavbar } from './components/SideNavbar'
import { init } from '@design-system/src/js/init.js'

export default function App() {
  useEffect(() => {
    init()
  }, [])

  return (
    <div style={{ display: 'flex', minHeight: '100vh' }}>
      <SideNavbar />
      <main style={{ padding: 'var(--space-lg)', flex: 1 }}>
        <Card>
          <JobFeed conditionId="demo" />
        </Card>
      </main>
    </div>
  )
}
