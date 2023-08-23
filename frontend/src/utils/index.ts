export const closeModalHandler = () => {
  const clickEvent = new MouseEvent('click', {
    bubbles: true,
    cancelable: true,
    view: window,
    clientX: 0,
    clientY: 0,
  });

  const targetElement = document.elementFromPoint(0, 0);
  targetElement?.dispatchEvent(clickEvent);
};

export const hasChild = (
  target: EventTarget | null,
  parent: HTMLElement | null,
): boolean => {
  if (!target || !parent) {
    return false;
  }

  let element: HTMLElement | null = target as HTMLElement;

  while (element) {
    if (element === parent) {
      return true;
    }
    element = element.parentElement;
  }

  return false;
};

export const priceToString = (price: number): string => {
  return price.toLocaleString('en-US');
};

export const truncateText = (text: string, maxLength: number): string => {
  if (text.length <= maxLength) {
    return text;
  }

  return text.slice(0, maxLength) + '...';
};
