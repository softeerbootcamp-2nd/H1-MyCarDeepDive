import { ReactNode } from 'react';

export interface InitialStateType {
  age: string;
  lifeStyle: string;
  myLifeStyle: {
    drivingExperience: string;
    numberOfFamilyMembers: string;
    purpose: string;
    lifeValue: string;
    budget: string;
  };
}

export interface QuestionContextType extends InitialStateType {
  questionDispatch: React.Dispatch<ActionType>;
}

export interface QuestionProviderProps {
  children: ReactNode;
}

interface AgeAction {
  type: 'SET_AGE';
  age: string;
}
interface LifeStyleAction {
  type: 'SET_LIFESTYLE';
  lifeStyle: string;
}
interface DrivingExperienceAction {
  type: 'SET_DRIVINGEXPERIENCE';
  drivingExperience: string;
}
interface NumberOfFamilyMembersAction {
  type: 'SET_NUMBEROFFAMILYMEMBERS';
  numberOfFamilyMembers: string;
}
interface PurposeActionAction {
  type: 'SET_PURPOSE';
  purpose: string;
}
interface LifeValueAction {
  type: 'SET_LIFEVALUE';
  lifeValue: string;
}
interface BudgetAction {
  type: 'SET_BUDGET';
  budget: string;
}

export type ActionType =
  | AgeAction
  | LifeStyleAction
  | DrivingExperienceAction
  | NumberOfFamilyMembersAction
  | PurposeActionAction
  | LifeValueAction
  | BudgetAction;

export const SET_AGE = 'SET_AGE';
export const SET_LIFESTYLE = 'SET_LIFESTYLE';
export const SET_DRIVINGEXPERIENCE = 'SET_DRIVINGEXPERIENCE';
export const SET_NUMBEROFFAMILYMEMBERS = 'SET_NUMBEROFFAMILYMEMBERS';
export const SET_PURPOSE = 'SET_PURPOSE';
export const SET_LIFEVALUE = 'SET_LIFEVALUE';
export const SET_BUDGET = 'SET_BUDGET';
