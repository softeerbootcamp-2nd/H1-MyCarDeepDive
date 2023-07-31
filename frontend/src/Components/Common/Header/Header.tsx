import Logo from "../../../assets/icon/logo.svg";
import headerDownArrow from "../../../assets/icon/headerDownArrow.svg";

function Header() {
  return (
    <header className="fixed w-full h-[92px] z-30 top-0 left-0">
      <div className="max-w-5xl h-full mx-auto flex items-center">
        <img src={Logo} alt="Hyundai-Logo" className="w-[129px]" />
        <span className="font-body4-medium text-grey-300 mr-1 ml-4">
          팰리세이드
        </span>
        <img src={headerDownArrow} alt="headerDownArrow" className="w-[20px]" />
      </div>
    </header>
  );
}

export default Header;
