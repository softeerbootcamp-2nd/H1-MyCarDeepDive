import { ReactNode } from 'react';

export interface InitialStateType {
  carSpec: {
    id: number;
    price: number;
    feature: {
      engine: string;
      body: string;
      drivingSystem: string;
    };
    trim: {
      id: number;
      name: string;
    };
  };

  color: {
    exteriorColor: {
      id: number;
      name: string;
      imgUrl: string;
      price: number;
      chooseRate: number;
    };
    interiorColor: {
      id: number;
      name: string;
      imgUrl: string;
      price: number;
      chooseRate: number;
    };
  };

  optionIdList: number[];
  optionData: { name: string; price: number }[];
}

export interface CarContextType extends InitialStateType {
  carDispatch: React.Dispatch<ActionType>;
}

export interface CarProviderProps {
  children: ReactNode;
}

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

interface CarSpecIdAction {
  type: 'SET_CARSPECID';
  carSpecId: number;
}

interface CarSpecPrice {
  type: 'SET_CARSPECPRICE';
  carSpecPrice: number;
}

interface TrimIdAction {
  type: 'SET_TRIMID';
  trimId: number;
}
interface TrimNameAction {
  type: 'SET_TRIMNAME';
  trimName: string;
}

interface ExteriorColorAction {
  type: 'SET_EXTERIORCOLOR';
  exteriorColor: {
    id: number;
    name: string;
    imgUrl: string;
    price: number;
    chooseRate: number;
  };
}

interface InteriorColorAction {
  type: 'SET_INTERIORCOLOR';
  interiorColor: {
    id: number;
    name: string;
    imgUrl: string;
    price: number;
    chooseRate: number;
  };
}

interface OptionAddAction {
  type: 'ADD_OPTION';
  optionIdList: number[];
}
interface OptionDeleteAction {
  type: 'DELETE_OPTION';
  optionIdList: number[];
}

interface OptionAddDataAction {
  type: 'ADD_OPTION_DATA';
  optionData: { name: string; price: number };
}
interface OptionDeleteDataAction {
  type: 'DELETE_OPTION_DATA';
  optionData: { name: string; price: number };
}
interface OptionAddListAction {
  type: 'ADD_OPTION_LIST';
  optionIdList: number[];
}
interface OptionAddListDataAction {
  type: 'ADD_OPTION_DATA_LIST';
  optionData: { name: string; price: number }[];
}

export type ActionType =
  | CarSpecIdAction
  | CarSpecPrice
  | EngineAction
  | BodyAction
  | DrivingSystemAction
  | TrimIdAction
  | TrimNameAction
  | ExteriorColorAction
  | InteriorColorAction
  | OptionAddAction
  | OptionDeleteAction
  | OptionAddDataAction
  | OptionDeleteDataAction
  | OptionAddListAction
  | OptionAddListDataAction;

export const SET_CARSPECID = 'SET_CARSPECID';
export const SET_CARSPECPRICE = 'SET_CARSPECPRICE';
export const SET_ENGINE = 'SET_ENGINE';
export const SET_BODY = 'SET_BODY';
export const SET_DRIVINGSYSTEM = 'SET_DRIVINGSYSTEM';
export const SET_TRIMID = 'SET_TRIMID';
export const SET_TRIMNAME = 'SET_TRIMNAME';
export const SET_EXTERIORCOLOR = 'SET_EXTERIORCOLOR';
export const SET_INTERIORCOLOR = 'SET_INTERIORCOLOR';
export const ADD_OPTION = 'ADD_OPTION';
export const DELETE_OPTION = 'DELETE_OPTION';
export const ADD_OPTION_DATA = 'ADD_OPTION_DATA';
export const DELETE_OPTION_DATA = 'DELETE_OPTION_DATA';
export const ADD_OPTION_LIST = 'ADD_OPTION_LIST';
export const ADD_OPTION_DATA_LIST = 'ADD_OPTION_DATA_LIST';
