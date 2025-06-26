import React from 'react'

export const Card: React.FC<{ children: React.ReactNode }> = ({ children }) => (
  <div className="bg-white dark:bg-gray-800 shadow rounded p-4">
    {children}
  </div>
)
