import { useReducer, createContext, ReactNode } from 'react';

interface InitialStateType {
  engine: string;
  body: string;
  drivingSystem: string;
  trim: string;
  exteriorColor: string;
  interiorColor: string;
  optionList: number[];
}

const initialState: InitialStateType = {
  engine: '',
  body: '',
  drivingSystem: '',
  trim: '',
  exteriorColor: '',
  interiorColor: '',
  optionList: [],
};

interface CarContextType extends InitialStateType {
  carDispatch: React.Dispatch<ActionType>;
}

export const CarContext = createContext<CarContextType>({
  ...initialState,
  carDispatch: () => {},
});

interface EngineAction {
  type: 'SET_ENGINE';
  engine: string;
}
interface BodyAction {
  type: 'SET_BODY';
  body: string;
}
interface DrivingSystemAction {
  type: 'SET_DRIVINGSYSTEM';
  drivingSystem: string;
}
interface TrimAction {
  type: 'SET_TRIM';
  trim: string;
}
interface ExteriorColorAction {
  type: 'SET_EXTERIORCOLOR';
  exteriorColor: string;
}
interface InteriorColorAction {
  type: 'SET_INTERIORCOLOR';
  interiorColor: string;
}
interface OptionAddAction {
  type: 'ADD_OPTION';
  option: number;
}
interface OptionDeleteAction {
  type: 'DELETE_OPTION';
  option: number;
}

type ActionType =
  | EngineAction
  | BodyAction
  | DrivingSystemAction
  | TrimAction
  | ExteriorColorAction
  | InteriorColorAction
  | OptionAddAction
  | OptionDeleteAction;

const reducer = (state: InitialStateType, action: ActionType) => {
  switch (action.type) {
    case 'SET_ENGINE':
      return { ...state, engine: action.engine };
    case 'SET_BODY':
      return { ...state, body: action.body };
    case 'SET_DRIVINGSYSTEM':
      return { ...state, drivingSystem: action.drivingSystem };
    case 'SET_TRIM':
      return { ...state, trim: action.trim };
    case 'SET_EXTERIORCOLOR':
      return { ...state, exteriorColor: action.exteriorColor };
    case 'SET_INTERIORCOLOR':
      return { ...state, interiorColor: action.interiorColor };
    case 'ADD_OPTION':
      return { ...state, option: action.option };
    case 'DELETE_OPTION':
      return { ...state, option: action.option };
    default:
      throw new Error();
  }
};

interface CarProviderProps {
  children: ReactNode;
}

const CarProvider = ({ children }: CarProviderProps) => {
  const [state, carDispatch] = useReducer(reducer, initialState);

  return (
    <CarContext.Provider
      value={{
        ...state,
        carDispatch,
      }}
    >
      {children}
    </CarContext.Provider>
  );
};

export default CarProvider;
