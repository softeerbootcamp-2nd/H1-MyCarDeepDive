import { TagIconProps } from '@/global/type';

function Performance({ fillColor }: TagIconProps) {
  return (
    <svg
      width='22'
      height='22'
      viewBox='0 0 22 22'
      fill='none'
      xmlns='http://www.w3.org/2000/svg'
      className={fillColor ? 'stroke-primary' : 'stroke-grey-100'}
    >
      <circle cx='13.4342' cy='6.06706' r='0.916667' />
      <circle cx='15.9479' cy='8.59635' r='0.916667' />
      <circle cx='11.0007' cy='11.0007' r='8.41667' strokeWidth='1.5' />
      <path
        d='M9.91581 7.88773C9.88636 7.60825 10.2723 7.50483 10.3866 7.76159L12.236 11.9186C12.3768 12.2351 12.3373 12.6029 12.1325 12.8823C11.8647 13.2478 11.3788 13.3779 10.9642 13.1954C10.647 13.0558 10.429 12.7571 10.3927 12.4125L9.91581 7.88773Z'
        fill='#303030'
      />
      <path
        d='M5.59999 12.0493C5.53437 11.7096 5.5 11.3588 5.5 10.9999C5.5 8.83624 6.74938 6.96438 8.56606 6.06641'
        strokeWidth='1.5'
        strokeLinecap='round'
      />
      <circle cx='16.401' cy='12.0495' r='0.916667' />
    </svg>
  );
}

export default Performance;
