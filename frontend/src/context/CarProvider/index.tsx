import { useReducer, createContext, useMemo } from 'react';
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
  ADD_OPTION_DATA,
  DELETE_OPTION_DATA,
  ADD_OPTION_DATA_LIST,
  ADD_OPTION_LIST,
  SET_DEFAULT,
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
      id: 7,
      name: '크리미 화이트 펄',
      imgUrl: 'img.make-my-car.shop/exterior/icon/WC9.jpg',
      price: 100000,
      chooseRate: 75,
    },
    interiorColor: {
      id: 10,
      name: '쿨그레이',
      imgUrl: 'img.make-my-car.shop/interior/icon/YJY.jpg',
      price: 0,
      chooseRate: 50,
    },
  },
  optionIdList: [],
  optionData: [],
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
            id: action.exteriorColor.id,
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
            id: action.interiorColor.id,
            name: action.interiorColor.name,
            imgUrl: action.interiorColor.imgUrl,
            price: action.interiorColor.price,
            chooseRate: action.interiorColor.chooseRate,
          },
        },
      };
    case ADD_OPTION:
      return {
        ...state,
        optionIdList: [...state.optionIdList, ...action.optionIdList],
      };
    case DELETE_OPTION:
      return {
        ...state,
        optionIdList: state.optionIdList.filter(
          item => !action.optionIdList.includes(item),
        ),
      };
    case ADD_OPTION_DATA:
      return {
        ...state,
        optionData: [...state.optionData, { ...action.optionData }],
      };
    case DELETE_OPTION_DATA:
      return {
        ...state,
        optionData: state.optionData.filter(
          item => item.name !== action.optionData.name,
        ),
      };
    case ADD_OPTION_LIST:
      return {
        ...state,
        optionIdList: [...action.optionIdList],
      };
    case ADD_OPTION_DATA_LIST:
      return {
        ...state,
        optionData: [...action.optionData],
      };
    case SET_DEFAULT:
      return {
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
            id: 7,
            name: '크리미 화이트 펄',
            imgUrl: 'img.make-my-car.shop/exterior/icon/WC9.jpg',
            price: 100000,
            chooseRate: 75,
          },
          interiorColor: {
            id: 10,
            name: '쿨그레이',
            imgUrl: 'img.make-my-car.shop/interior/icon/YJY.jpg',
            price: 0,
            chooseRate: 50,
          },
        },
        optionIdList: [],
        optionData: [],
      };
    default:
      throw new Error();
  }
};

const CarProvider = ({ children }: CarProviderProps) => {
  const [state, carDispatch] = useReducer(reducer, initialState);

  const memoValue = useMemo(() => {
    return { ...state, carDispatch };
  }, [state, carDispatch]);

  return (
    <CarContext.Provider value={memoValue}>{children}</CarContext.Provider>
  );
};

export default CarProvider;
