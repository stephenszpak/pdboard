/**
 * Bootstraps design system JS modules.
 * @module init
 */
import { initTheme, toggleTheme } from './theme.js';
import { initSidebar } from './sidebar.js';

/**
 * Initialize all components on the page.
 */
export function init() {
  initTheme();

  const sidebar = document.querySelector('.sidebar');
  const toggleBtn = document.querySelector('[data-sidebar-toggle]');
  if (sidebar && toggleBtn) {
    initSidebar(sidebar, toggleBtn);
  }

  const themeBtn = document.querySelector('[data-theme-toggle]');
  if (themeBtn) {
    themeBtn.addEventListener('click', toggleTheme);
  }
}

export default { init };
