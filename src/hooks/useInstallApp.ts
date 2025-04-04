import { useEffect } from "react";

const useInstallApp = () => {
  useEffect(() => {
    if (window._deferredPrompt) return;
    window.addEventListener("beforeinstallprompt", (event: any) => {
      event.preventDefault();
      window._deferredPrompt = event;
    });
  }, []);
};

export default useInstallApp;
