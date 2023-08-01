import LogoWhite from "../../../assets/icon/logo-white.svg";
import headerDownArrowBlack from "../../../assets/icon/headerDownArrowBlack.svg";

function Header() {
  return (
    <header className="fixed w-full h-[92px] z-30 top-0 left-0">
      <div className="max-w-5xl h-full mx-auto flex items-center">
        <img src={LogoWhite} alt="Hyundai-Logo" className="w-[129px]" />
        <span className="font-body4-medium text-grey-600 mr-1 ml-4">
          팰리세이드
        </span>
        <img
          src={headerDownArrowBlack}
          alt="headerDownArrow"
          className="w-[20px]"
        />
      </div>
    </header>
  );
}

export default Header;
