import { TagIconProps } from '@/global/type';

function All({ fillColor }: TagIconProps) {
  return (
    <svg
      width='22'
      height='22'
      viewBox='0 0 22 22'
      fill='none'
      xmlns='http://www.w3.org/2000/svg'
      className={fillColor ? 'fill-primary' : 'fill-grey-100'}
    >
      <path
        fillRule='evenodd'
        clipRule='evenodd'
        d='M15.3347 5.13477H13.9318V16.8632H15.3347V5.13477ZM19.1066 5.13477H17.7038V16.8632H19.1066V5.13477ZM8.61395 5.62646H7.02569L2.89453 16.8632H4.4514L5.43479 14.0605H10.1722L11.172 16.8632H12.7286L8.61395 5.62646ZM7.70804 7.58653C7.75967 7.4123 7.79674 7.26644 7.81843 7.14992C7.83736 7.2659 7.86964 7.41122 7.9147 7.58503L7.9153 7.58699C8.00296 7.87188 8.10711 8.17882 8.22749 8.50712L9.73019 12.8052H5.87685L7.39582 8.50686C7.5162 8.17853 7.62038 7.87144 7.70804 7.58653Z'
      />
    </svg>
  );
}

export default All;
