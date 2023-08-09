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
