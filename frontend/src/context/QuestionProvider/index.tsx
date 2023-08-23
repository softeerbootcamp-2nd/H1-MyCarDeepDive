import {
  ActionType,
  InitialStateType,
  QuestionContextType,
  QuestionProviderProps,
  SET_AGE,
  SET_LIFESTYLE,
  SET_DRIVINGEXPERIENCE,
  SET_NUMBEROFFAMILYMEMBERS,
  SET_PURPOSE,
  SET_LIFEVALUE,
  SET_BUDGET,
} from './type';
import { createContext, useMemo, useReducer } from 'react';

const initialState: InitialStateType = {
  age: '20대',
  lifeStyle: '',
  myLifeStyle: {
    drivingExperience: '1년 이하',
    numberOfFamilyMembers: '1인',
    purpose: '',
    lifeValue: '',
    budget: '6900',
  },
};

export const QuestionContext = createContext<QuestionContextType>({
  ...initialState,
  questionDispatch: () => {},
});

const reducer = (state: InitialStateType, action: ActionType) => {
  switch (action.type) {
    case SET_AGE:
      return { ...state, age: action.age };
    case SET_LIFESTYLE:
      return { ...state, lifeStyle: action.lifeStyle };
    case SET_DRIVINGEXPERIENCE:
      return {
        ...state,
        myLifeStyle: {
          ...state.myLifeStyle,
          drivingExperience: action.drivingExperience,
        },
      };
    case SET_NUMBEROFFAMILYMEMBERS:
      return {
        ...state,
        myLifeStyle: {
          ...state.myLifeStyle,
          numberOfFamilyMembers: action.numberOfFamilyMembers,
        },
      };
    case SET_PURPOSE:
      return {
        ...state,
        myLifeStyle: {
          ...state.myLifeStyle,
          purpose: action.purpose,
        },
      };
    case SET_LIFEVALUE:
      return {
        ...state,
        myLifeStyle: {
          ...state.myLifeStyle,
          lifeValue: action.lifeValue,
        },
      };
    case SET_BUDGET:
      return {
        ...state,
        myLifeStyle: {
          ...state.myLifeStyle,
          budget: action.budget,
        },
      };
    default:
      throw new Error();
  }
};

const QuestionProvider = ({ children }: QuestionProviderProps) => {
  const [state, questionDispatch] = useReducer(reducer, initialState);

  const memoValue = useMemo(() => {
    return { ...state, questionDispatch };
  }, [state, questionDispatch]);

  return (
    <QuestionContext.Provider value={memoValue}>
      {children}
    </QuestionContext.Provider>
  );
};

export default QuestionProvider;
