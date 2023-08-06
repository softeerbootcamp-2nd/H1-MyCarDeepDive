import { addtionQuestionTitleProps } from '@/global/type';

function AdditionQuestionTitle({ title }: addtionQuestionTitleProps) {
  return <p className='mb-[18px] font-body2-medium text-grey-100'>{title} </p>;
}

export default AdditionQuestionTitle;
