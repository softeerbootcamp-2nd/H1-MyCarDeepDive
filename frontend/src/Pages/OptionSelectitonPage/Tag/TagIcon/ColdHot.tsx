import { TagIconProps } from '@/global/type';

function ColdHot({ fillColor }: TagIconProps) {
  return (
    <svg
      width='22'
      height='22'
      viewBox='0 0 22 22'
      fill='none'
      xmlns='http://www.w3.org/2000/svg'
      className={fillColor ? 'stroke-primary' : 'stroke-grey-100'}
    >
      <path
        d='M10.1149 20.0784C12.3423 20.0784 14.1479 18.2728 14.1479 16.0455C14.1479 14.6797 13.4689 13.4725 12.4302 12.743V4.38221C12.4302 3.40555 11.8173 2.53392 10.8982 2.20349C10.3919 2.02145 9.83798 2.02145 9.33164 2.20349C8.41257 2.53392 7.79969 3.40555 7.79969 4.38221V12.743C6.76094 13.4725 6.08203 14.6797 6.08203 16.0455C6.08203 18.2728 7.88763 20.0784 10.1149 20.0784Z'
        strokeWidth='1.5'
      />
      <circle cx='10.1143' cy='16.0459' r='1.55375' strokeWidth='1.5' />
      <path d='M10.1152 14.3736V7.15039' strokeWidth='1.5' />
      <path
        d='M14.668 7.28711H18.3346'
        strokeWidth='1.5'
        strokeLinecap='round'
      />
      <path
        d='M14.668 9.57812H17.6118'
        strokeWidth='1.5'
        strokeLinecap='round'
      />
    </svg>
  );
}

export default ColdHot;
