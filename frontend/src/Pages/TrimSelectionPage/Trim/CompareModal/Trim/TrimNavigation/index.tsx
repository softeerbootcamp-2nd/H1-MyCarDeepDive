import navigation from '@/assets/icon/Navigation.svg';

interface TrimNavigationProps {
  seat_name: string;
  navigation_size: number;
}

function TrimNavigation({ seat_name, navigation_size }: TrimNavigationProps) {
  return (
    <>
      <img
        src={navigation}
        alt={'네비게이션'}
        className={`${
          seat_name.length > 16 ? 'mt-[27px]' : 'mt-[51px]'
        } mb-2 mx-auto`}
      />
      <div className='font-h1-bold text-secondary mb-1'>
        {navigation_size + ' inch '}
      </div>
      <div className='font-body3-regular text-grey-300'>
        <span className='leading-[16px]'>{'네비게이션'}</span>
      </div>
    </>
  );
}

export default TrimNavigation;
