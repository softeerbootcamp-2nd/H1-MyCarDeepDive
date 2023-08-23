import { ReactNode } from 'react';

export interface InitialStateType {
  optionId: number;
  packageOption: boolean;
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

interface PackageOptionAction {
  type: 'SET_PACKAGE';
  packageOption: boolean;
}

export type ActionType = OptionAction | PackageOptionAction;

export const SET_OPTIONID = 'SET_OPTIONID';
export const SET_PACKAGE = 'SET_PACKAGE';
