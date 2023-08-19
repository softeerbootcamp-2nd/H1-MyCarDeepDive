import { useReducer, createContext } from 'react';
import {
  InitialStateType,
  CarContextType,
  ActionType,
  CarProviderProps,
  SET_ENGINE,
  SET_BODY,
  SET_DRIVINGSYSTEM,
  SET_TRIM,
  SET_EXTERIORCOLOR,
  SET_INTERIORCOLOR,
  ADD_OPTION,
  DELETE_OPTION,
} from './type';

const initialState: InitialStateType = {
  feature: {
    engine: '디젤 2.2',
    body: '7인승',
    drivingSystem: '2WD',
  },
  trim: 'Le Blanc',
  exteriorColor: '',
  interiorColor: '',
  optionList: [],
};

export const CarContext = createContext<CarContextType>({
  ...initialState,
  carDispatch: () => {},
});

const reducer = (state: InitialStateType, action: ActionType) => {
  switch (action.type) {
    case SET_ENGINE:
      return {
        ...state,
        feature: {
          ...state.feature,
          engine: action.engine,
        },
      };
    case SET_BODY:
      return {
        ...state,
        feature: {
          ...state.feature,
          body: action.body,
        },
      };
    case SET_DRIVINGSYSTEM:
      return {
        ...state,
        feature: {
          ...state.feature,
          drivingSystem: action.drivingSystem,
        },
      };
    case SET_TRIM:
      return { ...state, trim: action.trim };
    case SET_EXTERIORCOLOR:
      return { ...state, exteriorColor: action.exteriorColor };
    case SET_INTERIORCOLOR:
      return { ...state, interiorColor: action.interiorColor };
    case ADD_OPTION:
      return { ...state, optionList: [...state.optionList, action.option] };
    case DELETE_OPTION:
      return {
        ...state,
        optionList: state.optionList.filter(
          (item: number) => item !== action.option,
        ),
      };
    default:
      throw new Error();
  }
};

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
