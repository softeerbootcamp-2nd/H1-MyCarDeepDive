import { useReducer, createContext } from 'react';
import {
  InitialStateType,
  OptionContextType,
  ActionType,
  OptionProviderProps,
  SET_OPTIONID,
} from './type';

const initialState: InitialStateType = {
  optionId: 0,
};

export const OptionContext = createContext<OptionContextType>({
  ...initialState,
  optionDispatch: () => {},
});

const reducer = (state: InitialStateType, action: ActionType) => {
  switch (action.type) {
    case SET_OPTIONID:
      return { ...state, optionId: action.optionId };
    default:
      throw new Error();
  }
};

const OptionProvider = ({ children }: OptionProviderProps) => {
  const [state, optionDispatch] = useReducer(reducer, initialState);

  return (
    <OptionContext.Provider
      value={{
        ...state,
        optionDispatch,
      }}
    >
      {children}
    </OptionContext.Provider>
  );
};

export default OptionProvider;
