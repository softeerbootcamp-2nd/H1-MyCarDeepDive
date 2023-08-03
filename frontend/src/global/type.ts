export type RadioProps = {
  name: string;
  value: string;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
};

export type QuestionStepProps = {
  step: number;
};

export type LifeStyleRadioProps = {
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
  setShowLifeStyleModal: React.Dispatch<React.SetStateAction<boolean>>;
  data: {
    value: string;
    tags: string[];
    description: string;
    profileImage: string;
  };
};
