import { useContext } from 'react';
import useFetch, { GET } from '@/hooks/useFetch';
import { QuestionContext } from '@/context/QuestionProvider';
import { getRecommendationType } from './getRecommendation';

const drivingExperienceList = ['1년 이하', '1년 이상 ~ 5년 미만', '5년 이상'];
const familyMembersList = ['1인', '2인', '3-4인', '5인 이상'];
const purposeList = ['출퇴근용', '레저용', '가정용', '업무용'];
const lifeValueList = ['디자인', '성능', '안전', '편의성'];

function getCustomRecommendation(): getRecommendationType | undefined {
  const { myLifeStyle } = useContext(QuestionContext);
  const drivingExperienceId =
    drivingExperienceList.indexOf(myLifeStyle.drivingExperience) + 1;
  const familyMembersId =
    familyMembersList.indexOf(myLifeStyle.numberOfFamilyMembers) + 1;
  const carPurposeId = purposeList.indexOf(myLifeStyle.purpose) + 1;
  const personalValueId = lifeValueList.indexOf(myLifeStyle.lifeValue) + 1;

  if (carPurposeId === -1 || personalValueId === -1) return undefined;
  return useFetch({
    method: GET,
    url: `/car-recommendation/custom?drivingExperienceId=${drivingExperienceId}&familyMembersId=${familyMembersId}&carPurposeId=${carPurposeId}&personalValueId=${personalValueId}&maxBudget=${myLifeStyle.budget}`,
  });
}

export default getCustomRecommendation;
