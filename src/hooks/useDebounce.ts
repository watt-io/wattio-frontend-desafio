import { useEffect } from "react";

interface Options {
  before?(): void;
  after(): void;
  wait?: number;
}

const useDebounce = <T>(options: Options, dependencies: any[]) => {
  useEffect(() => {
    options.before?.();
    const timeout = setTimeout(options.after, options.wait ?? 500);
    return () => {
      clearTimeout(timeout);
    };
  }, dependencies);
};

export default useDebounce;
