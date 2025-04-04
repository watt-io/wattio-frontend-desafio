const { localStorage } = window;
export const getItem = localStorage.getItem.bind(localStorage);
export const hasItem = localStorage.hasOwnProperty.bind(localStorage);
export const setItem = localStorage.setItem.bind(localStorage);
export const getAsOBJ = <T>(key: string, value: T) =>
  (hasItem(key) ? getItem(key) : value) as T;
export const setAsJSON = <T>(key: string, value: T & object) =>
  setItem(key, JSON.stringify(value));
