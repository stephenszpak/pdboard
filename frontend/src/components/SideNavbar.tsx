import React from 'react'

export const SideNavbar: React.FC = () => (
  <aside className="sidebar" aria-expanded="true">
    <button className="sidebar__toggle" data-sidebar-toggle>☰</button>
    <ul className="sidebar__nav">
      <li className="sidebar__item sidebar__item--active">Home</li>
      <li className="sidebar__item">Link</li>
    </ul>
  </aside>
)

