import { createContext, useContext } from 'react';

export const OfferContext = createContext();

export function useOfferContext() {
  const context = useContext(OfferContext);
  if (!context) {
    throw new Error('useOfferContext must be used within an OfferContext.Provider');
  }
  return context;
}

