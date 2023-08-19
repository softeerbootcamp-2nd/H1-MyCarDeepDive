import { useReducer, createContext } from 'react';
import {
  InitialStateType,
  CarContextType,
  ActionType,
  CarProviderProps,
  SET_CARSPECID,
  SET_CARSPECPRICE,
  SET_ENGINE,
  SET_BODY,
  SET_DRIVINGSYSTEM,
  SET_TRIMID,
  SET_TRIMNAME,
  SET_EXTERIORCOLOR,
  SET_INTERIORCOLOR,
  ADD_OPTION,
  DELETE_OPTION,
} from './type';

const initialState: InitialStateType = {
  carSpec: {
    id: 2,
    price: 43460200,
    feature: {
      engine: '디젤 2.2',
      body: '7인승',
      drivingSystem: '2WD',
    },
    trim: {
      id: 2,
      name: 'Le Blanc',
    },
  },
  exteriorColor: '크리미 화이트 펄',
  interiorColor: '퀄팅 천연(블랙)',
  optionList: [],
};

export const CarContext = createContext<CarContextType>({
  ...initialState,
  carDispatch: () => {},
});

const reducer = (state: InitialStateType, action: ActionType) => {
  switch (action.type) {
    case SET_CARSPECID:
      return {
        ...state,
        carSpec: {
          ...state.carSpec,
          id: action.carSpecId,
        },
      };
    case SET_CARSPECPRICE:
      return {
        ...state,
        carSpec: {
          ...state.carSpec,
          price: action.carSpecPrice,
        },
      };
    case SET_ENGINE:
      return {
        ...state,
        carSpec: {
          ...state.carSpec,
          feature: {
            ...state.carSpec.feature,
            engine: action.engine,
          },
        },
      };
    case SET_BODY:
      return {
        ...state,
        carSpec: {
          ...state.carSpec,
          feature: {
            ...state.carSpec.feature,
            body: action.body,
          },
        },
      };
    case SET_DRIVINGSYSTEM:
      return {
        ...state,
        carSpec: {
          ...state.carSpec,
          feature: {
            ...state.carSpec.feature,
            drivingSystem: action.drivingSystem,
          },
        },
      };
    case SET_TRIMID:
      return {
        ...state,
        carSpec: {
          ...state.carSpec,
          trim: {
            ...state.carSpec.trim,
            id: action.trimId,
          },
        },
      };
    case SET_TRIMNAME:
      return {
        ...state,
        carSpec: {
          ...state.carSpec,
          trim: {
            ...state.carSpec.trim,
            name: action.trimName,
          },
        },
      };
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
