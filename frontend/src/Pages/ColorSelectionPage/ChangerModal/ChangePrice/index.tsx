function ChangePrice({ priceGap }: { priceGap: number }) {
  return (
    <div className='flex justify-between'>
      <p className='font-body3-medium'>
        <span className='leading-[22px] text-secondary'>변경 금액</span>
      </p>

      <p className='font-h3-medium'>
        {priceGap >= 0
          ? `+${priceGap.toLocaleString('en-US')}`
          : `-${priceGap.toLocaleString('en-US')}`}
        원
      </p>
    </div>
  );
}

export default ChangePrice;
