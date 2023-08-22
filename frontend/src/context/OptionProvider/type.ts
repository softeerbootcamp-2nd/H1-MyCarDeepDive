import { ReactNode } from 'react';

export interface InitialStateType {
  optionId: number;
}

export interface OptionContextType extends InitialStateType {
  optionDispatch: React.Dispatch<ActionType>;
}

export interface OptionProviderProps {
  children: ReactNode;
}

interface OptionAction {
  type: 'SET_OPTIONID';
  optionId: number;
}

export type ActionType = OptionAction;

export const SET_OPTIONID = 'SET_OPTIONID';
