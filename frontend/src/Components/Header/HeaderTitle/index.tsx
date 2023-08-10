function HeaderTitle() {
  const isHome: boolean = location.pathname === '/';
  return (
    <p
      className={`font-body4-medium mr-1 ml-4 flex items-center ${
        isHome ? 'text-grey-600' : 'text-grey-50'
      }`}
    >
      팰리세이드
    </p>
  );
}

export default HeaderTitle;
