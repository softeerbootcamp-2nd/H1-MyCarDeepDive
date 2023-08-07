interface Profile {
  lifeStyleProfile: string;
}

function Profile({ lifeStyleProfile }: Profile) {
  return (
    <div className='mt-10 flex gap-4'>
      <img
        src={lifeStyleProfile}
        alt='profile'
        className='w-12 h-12 rounded-full'
      />
      <div className='flex flex-col justify-center'>
        <div className='font-body3-medium text-grey-50'>김현대</div>
        <div className='font-caption1-regular text-grey-400'>
          두 아이의 엄마
        </div>
      </div>
    </div>
  );
}

export default Profile;
