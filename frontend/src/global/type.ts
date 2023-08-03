export type RadioProps = {
  name: string;
  value: string;
  onChangeHandler: (e: React.ChangeEvent<HTMLInputElement>) => void;
};

export type QuestionStepProps = {
  step: number;
};
