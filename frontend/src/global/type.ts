import { ReactNode } from 'react';

export interface ModalProps {
  showModal: boolean;
  setShowModal: React.Dispatch<React.SetStateAction<boolean>>;
}

export interface WrapperProps {
  children: ReactNode;
}

export interface NavigationRadioProps {
  name: string;
  index: number;
  value: string;
  address: string;
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

export interface TagIconProps {
  fillColor: boolean;
}
