import { ReactNode } from 'react';

export interface InitialStateType {
  step: string;
  prevStep: InitialStateType | undefined;
  lifeStyle: string;
  drivingExperience: string;
  numberOfFamilyMembers: string;
  purpose: string;
  value: string;
  budget: string;
}

export interface QuestionContextType extends InitialStateType {
  QuestionDispatch: React.Dispatch<ActionType>;
}

export interface QuestionProviderProps {
  children: ReactNode;
}

interface AgeAction {
  type: 'SET_AGE';
  age: string;
}
interface PrevStepAction {
  type: 'SET_PREVSTEP';
  prevStep: InitialStateType | undefined;
}
interface LifeStyleAction {
  type: 'SET_LIFESTYLE';
  lifeStyle: string;
}
interface DrivingExperienceAction {
  type: 'SET_DRIVINGEXPERIENCE';
  drivingExperience: string;
}
interface NumberOfFamilyMembers {
  type: 'SET_NUMBEROFFAMILYMEMBERS';
  numberOfFamilyMembers: string;
}
interface PurposeAction {
  type: 'SET_PURPOSE';
  purpose: string;
}
interface Value {
  type: 'SET_VALUE';
  value: string;
}
interface Budget {
  type: 'SET_BUDGET';
  budget: string;
}

export type ActionType =
  | AgeAction
  | PrevStepAction
  | LifeStyleAction
  | DrivingExperienceAction
  | NumberOfFamilyMembers
  | PurposeAction
  | Value
  | Budget;

export const SET_AGE = 'SET_AGE';
export const SET_PREVSTEP = 'SET_PREVSTEP';
export const SET_LIFESTYLE = 'SET_LIFESTYLE';
export const SET_DRIVINGEXPERIENCE = 'SET_DRIVINGEXPERIENCE';
export const SET_NUMBEROFFAMILYMEMBERS = 'SET_NUMBEROFFAMILYMEMBERS';
export const SET_PURPOSE = 'SET_PURPOSE';
export const ADD_VALUE = 'SET_VALUE';
export const DELETE_BUDGET = 'SET_BUDGET';
