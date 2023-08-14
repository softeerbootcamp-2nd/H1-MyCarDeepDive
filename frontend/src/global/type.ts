import { ReactNode } from 'react';

export interface ModalProps {
  showModal: boolean;
  setShowModal: React.Dispatch<React.SetStateAction<boolean>>;
}

export interface TrimChangeModalProps extends ModalProps {
  mycarTrimHandler: React.Dispatch<React.SetStateAction<void>>;
}

export interface RadioProps {
  name: string;
  value: string;
  isLong?: boolean;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

export interface QuestionStepProps {
  step: string;
}

export interface LifeStyleRadioProps {
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  setShowLifeStyleModal: React.Dispatch<React.SetStateAction<boolean>>;
  data: {
    value: string;
    tags: string[];
    description: string;
    profileImage: string;
  };
}

export interface WrapperProps {
  children: ReactNode;
}

export interface RecommendQuestionPageProps {
  step: string;
  prevStep: string | undefined;
  lifeStyle: string;
  myLifeStyle: {
    drivingExperience: string;
    numberOfFamilyMembers: string;
    purpose: string;
    value: string;
    budget: string;
  };
  age: string;
  ageHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  lifeStyleHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  myLifeStyleHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

export interface QuestionBodyProps {
  step: string;
  age: string;
  lifeStyle: string;
  myLifeStyle: {
    drivingExperience: string;
    numberOfFamilyMembers: string;
    purpose: string;
    value: string;
    budget: string;
  };
  ageHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  lifeStyleHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  myLifeStyleHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

export interface AddtionQuestionTitleProps {
  title: string;
}

export interface AdditionQuestionBudgetProps {
  budget: string;
  myLifeStyleHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

export interface NavigationRadioProps {
  name: string;
  index: number;
  value: string;
  address: string;
}

export interface FeatureSelectRadioGroupProps {
  carFeature: {
    engine: string;
    body: string;
    operation: string;
  };
  mycarFeatureHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

export interface TrimSelectionRadioGroupProps {
  selectedTrim: string;
  carFeature: {
    engine: string;
    body: string;
    operation: string;
  };
  trim?: {
    name: string;
    description: string;
    basicOption: string[];
    price: number;
  };
  setWantedTrim: React.Dispatch<React.SetStateAction<string>>;
  setShowModal: (value: boolean) => void;
  optionToolTipHandler: (
    x: number | undefined,
    y: number | undefined,
    target: string,
  ) => void;
}

export interface NavBarCategoryProps {
  category: string;
  categoryClickHandler: (
    e: React.MouseEvent<HTMLButtonElement, MouseEvent>,
  ) => void;
}

export interface TrimChangeUnlockProps {
  unlockList: {
    image: string;
    name: string;
  }[];
}

export interface setShowPriceInfoProps {
  showPriceInfo: boolean;
  setShowPriceInfo: (value: boolean) => void;
}

export interface TrimChangeButtonProps {
  mycarTrimHandler: React.Dispatch<React.SetStateAction<void>>;
}
