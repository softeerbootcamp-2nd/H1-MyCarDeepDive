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
  color: {
    exteriorColor: {
      // id: 1,
      name: '크리미 화이트 펄',
      imgUrl: '/src/assets/image/exterior-creamy.png',
      price: 100000,
      chooseRate: 90,
    },
    interiorColor: {
      // id: 1,
      name: '퀄팅천연 (블랙)',
      imgUrl: '/src/assets/image/interior-quilted.png',
      price: 0,
      chooseRate: 70,
    },
  },
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
      return {
        ...state,
        color: {
          ...state.color,
          exteriorColor: {
            ...state.color.exteriorColor,
            // id: action.exteriorColor.id,
            name: action.exteriorColor.name,
            imgUrl: action.exteriorColor.imgUrl,
            price: action.exteriorColor.price,
            chooseRate: action.exteriorColor.chooseRate,
          },
        },
      };

    case SET_INTERIORCOLOR:
      return {
        ...state,
        color: {
          ...state.color,
          interiorColor: {
            ...state.color.interiorColor,
            // id: action.interiorColor.id,
            name: action.interiorColor.name,
            imgUrl: action.interiorColor.imgUrl,
            price: action.interiorColor.price,
            chooseRate: action.interiorColor.chooseRate,
          },
        },
      };
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
