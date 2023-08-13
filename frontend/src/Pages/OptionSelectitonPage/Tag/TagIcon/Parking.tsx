import { TagIconProps } from '@/global/type';

function Parking({ fillColor }: TagIconProps) {
  return (
    <svg
      width='22'
      height='22'
      viewBox='0 0 22 22'
      fill='none'
      xmlns='http://www.w3.org/2000/svg'
      className={fillColor ? 'stroke-primary' : 'stroke-grey-100'}
    >
      <rect
        x='3.27148'
        y='3.27148'
        width='15.4583'
        height='15.4583'
        rx='1.08333'
        strokeWidth='1.5'
        strokeMiterlimit='3.99933'
      />
      <path
        d='M8.57227 16.4301V11.5059M8.57227 11.5059V6.00586H11.9376C12.8691 6.00586 13.7372 6.47732 14.2443 7.25857V7.25857C14.8354 8.16925 14.8354 9.34249 14.2443 10.2532V10.2532C13.7372 11.0344 12.8691 11.5059 11.9376 11.5059H8.57227Z'
        strokeWidth='1.5'
      />
    </svg>
  );
}

export default Parking;
