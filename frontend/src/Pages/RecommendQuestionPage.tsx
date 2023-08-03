import { useEffect, useState } from "react";
import Button from "../Components/Common/Button/Button";
import RadioGroup from "../Components/Common/RadioGroup/RadioGroup";

const ageList = ["20대", "30대", "40대", "50대 이상"];

function RecommendQuestionPage() {
  // const [page, setPage] = useState(1);
  const [age, setAge] = useState("20대");

  const ageClick = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    setAge(target.value);
  };

  useEffect(() => {
    console.log(age);
  }, [age]);

  return (
    <>
      <div className="mt-[92px] w-full h-[4px] bg-grey-800"></div>
      <div className="mt-[48px] mb-[24px] max-w-[608px] h-full mx-auto flex items-center justify-between">
        <p className="font-h2-medium">
          {" "}
          <span className="text-[22px] leading-[28px]">나이</span>
          <span className="font-h5-regular">
            <span className="text-[22px] leading-[28px]">를 알려주세요.</span>
          </span>
        </p>

        <div className="w-[64px] h-[36px] shrink-0 rounded-[22px] bg-grey-900  flex justify-center items-center">
          <span className="font-h4-medium">
            <span className="leading-[24px] tracking-[-0.2px] text-grey-400">
              1/2
            </span>
          </span>
        </div>
      </div>

      <div className="max-w-[608px] h-full mx-auto flex flex-wrap justify-center items-center gap-[12px]">
        <RadioGroup
          data={ageList}
          name={"age"}
          value={age}
          onChangeHandler={ageClick}
        />
      </div>

      <div className="fixed bottom-[36px] w-full flex justify-center items-center">
        <Button
          width="w-[608px]"
          height="h-[52px]"
          variant="primary"
          text="다음"
          onClick={() => console.log("primary")}
        />
      </div>
    </>
  );
}

export default RecommendQuestionPage;
