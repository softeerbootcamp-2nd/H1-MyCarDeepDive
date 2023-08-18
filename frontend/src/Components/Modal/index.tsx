import { ReactNode, useEffect, useRef, useState } from 'react';
import { ModalProps } from '@/global/type';

interface CommonModalProps extends ModalProps {
  children: ReactNode;
}

function Modal({ showModal, setShowModal, children }: CommonModalProps) {
  const modalRef = useRef<HTMLDivElement>(null);
  const [isAnimating, setIsAnimating] = useState(false);

  const modalOutSideClick = (e: React.MouseEvent<HTMLElement>) => {
    if (modalRef.current === e.target) setIsAnimating(false);
  };

  const eventHandler = (e: KeyboardEvent) => {
    if (e.key === 'Escape') setIsAnimating(false);
  };

  useEffect(() => {
    if (showModal) {
      document.body.classList.add('overflow-hidden');
      document.addEventListener('keydown', eventHandler);
      setTimeout(() => setIsAnimating(true), 10);
    }
  }, [showModal]);

  useEffect(() => {
    if (!isAnimating) {
      document.body.classList.remove('overflow-hidden');
      document.addEventListener('keydown', eventHandler);
      setTimeout(() => setShowModal(false), 1010);
    }
  }, [isAnimating, setShowModal]);

  useEffect(() => {
    return () => {
      document.body.classList.remove('overflow-hidden');
    };
  }, []);

  if (!showModal) return null;
  return (
    <div
      ref={modalRef}
      onClick={e => modalOutSideClick(e)}
      className={`fixed top-0 left-0 z-50 overflow-y-auto md:inset-0 min-h-screen bg-bgModal scale-100 transition-opacity duration-1000 ${
        isAnimating ? 'active opacity-100' : 'opacity-0'
      }`}
    >
      {children}
    </div>
  );
}

export default Modal;
