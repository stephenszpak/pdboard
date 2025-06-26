/**
 * Sidebar collapse/expand logic.
 * @module sidebar
 */
const STORAGE_KEY = 'ds-sidebar';

/**
 * Apply collapsed state.
 * @param {HTMLElement} el
 * @param {boolean} collapsed
 */
export function applyCollapsed(el, collapsed) {
  el.classList.toggle('sidebar--collapsed', collapsed);
  el.setAttribute('aria-expanded', String(!collapsed));
}

/**
 * Retrieve stored sidebar state.
 * @returns {boolean}
 */
export function getStoredState() {
  try {
    return localStorage.getItem(STORAGE_KEY) === 'collapsed';
  } catch (e) {
    return false;
  }
}

/**
 * Store sidebar state.
 * @param {boolean} collapsed
 */
export function storeState(collapsed) {
  try {
    localStorage.setItem(STORAGE_KEY, collapsed ? 'collapsed' : 'expanded');
  } catch (e) {
    // ignore
  }
}

/**
 * Toggle sidebar state.
 * @param {HTMLElement} el
 * @returns {boolean} new state
 */
export function toggleSidebar(el) {
  const collapsed = !el.classList.contains('sidebar--collapsed');
  applyCollapsed(el, collapsed);
  storeState(collapsed);
  return collapsed;
}

/**
 * Initialize sidebar element.
 * @param {HTMLElement} el - sidebar element
 * @param {HTMLElement} button - toggle button
 */
export function initSidebar(el, button) {
  const collapsed = getStoredState();
  applyCollapsed(el, collapsed);

  button.addEventListener('click', () => {
    toggleSidebar(el);
  });
}
