import { ReactNode } from 'react';

export interface ModalProps {
  showModal: boolean;
  setShowModal: React.Dispatch<React.SetStateAction<boolean>>;
}

export interface WrapperProps {
  children: ReactNode;
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

export interface ColorType {
  color_id: number;
  trim_id: number;
  trim_name: string;
  name: string;
  img_url: string;
  car_img_url?: string;
  car_img_urls?: string[];
  price: number;
  choose_rate: number;
}
