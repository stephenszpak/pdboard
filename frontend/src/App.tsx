import React from 'react'
import { Card } from './components/Card'
import { JobFeed } from './components/JobFeed'

export default function App() {
  return (
    <div className="min-h-screen bg-gray-100 dark:bg-gray-900 text-gray-900 dark:text-gray-100">
      <nav className="p-4 bg-gray-200 dark:bg-gray-800 mb-4">
        <span className="font-bold">Welcome, user</span>
      </nav>
      <div className="max-w-2xl mx-auto p-4">
        <Card>
          <JobFeed conditionId="demo" />
        </Card>
      </div>
    </div>
  )
}
