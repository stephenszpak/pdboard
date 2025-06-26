/**
 * Theme toggling utilities.
 * @module theme
 */
const STORAGE_KEY = 'ds-theme';

/**
 * Get stored theme from localStorage.
 * @returns {string|null}
 */
export function getStoredTheme() {
  try {
    return localStorage.getItem(STORAGE_KEY);
  } catch (e) {
    return null;
  }
}

/**
 * Save theme preference.
 * @param {string} value - 'light' or 'dark'
 */
export function storeTheme(value) {
  try {
    localStorage.setItem(STORAGE_KEY, value);
  } catch (e) {
    // ignore
  }
}

/**
 * Apply theme to <html> element.
 * @param {string} value - theme name
 */
export function applyTheme(value) {
  document.documentElement.setAttribute('data-theme', value);
}

/**
 * Toggle between light and dark theme.
 * @returns {string} The new theme
 */
export function toggleTheme() {
  const current = document.documentElement.getAttribute('data-theme') || 'light';
  const next = current === 'light' ? 'dark' : 'light';
  applyTheme(next);
  storeTheme(next);
  return next;
}

/**
 * Initialize theme based on stored value or prefers-color-scheme.
 */
export function initTheme() {
  const stored = getStoredTheme();
  if (stored) {
    applyTheme(stored);
  } else {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    applyTheme(prefersDark ? 'dark' : 'light');
  }
}
