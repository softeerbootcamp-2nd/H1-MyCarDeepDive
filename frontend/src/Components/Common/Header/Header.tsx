import { useLocation } from "react-router-dom";
import LogoWhite from "../../../assets/icon/logo-white.svg";
import Logo from "../../../assets/icon/logo.svg";
import headerDownArrowBlack from "../../../assets/icon/headerDownArrowBlack.svg";
import headerDownArrow from "../../../assets/icon/headerDownArrow.svg";

function Header() {
  const location = useLocation();
  const isHome: boolean = location.pathname === "/";

  return (
    <header className="fixed w-full h-[92px] z-30 top-0 left-0">
      <div className="max-w-5xl h-full mx-auto flex items-center">
        <img
          src={isHome ? LogoWhite : Logo}
          alt="Hyundai-Logo"
          className="w-[129px]"
        />
        <span
          className={`font-body4-medium mr-1 ml-4 ${
            isHome ? "text-grey-600" : "text-grey-300"
          }`}
        >
          팰리세이드
        </span>
        <img
          src={isHome ? headerDownArrowBlack : headerDownArrow}
          alt="headerDownArrow"
          className="w-[20px]"
        />
      </div>
    </header>
  );
}

export default Header;
