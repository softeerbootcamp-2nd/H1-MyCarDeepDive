import {
  createContext,
  ReactNode,
  useRef,
  useCallback,
  useEffect,
} from 'react';

export const CacheContext = createContext<{
  getByCache: (url: string) => any;
  setByCache: (url: string, data: any) => void;
}>({
  getByCache: () => null,
  setByCache: () => {},
});

const CacheProvider = ({ children }: { children: ReactNode }) => {
  const cacheRef = useRef<{ [key: string]: any }>({});
  const expirations = useRef<{ [key: string]: number }>({});

  const getByCache = useCallback((url: string): any => {
    return cacheRef.current[url];
  }, []);

  const setByCache = useCallback((url: string, data: any): void => {
    expirations.current[url] = Date.now() + 5000;
    cacheRef.current[url] = data;
  }, []);

  useEffect(() => {
    const interval = setInterval(() => {
      for (const [url, time] of Object.entries(expirations.current)) {
        if (time > Date.now()) return;

        delete cacheRef.current[url];
        delete expirations.current[url];
      }
    }, 1000);
    return () => clearInterval(interval);
  }, []);

  return (
    <CacheContext.Provider value={{ getByCache, setByCache }}>
      {children}
    </CacheContext.Provider>
  );
};

export default CacheProvider;
