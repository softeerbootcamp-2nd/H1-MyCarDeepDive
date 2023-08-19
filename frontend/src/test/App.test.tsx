import '@testing-library/jest-dom';
import { render, screen, fireEvent } from '@testing-library/react';

import App from '@/App';
import Wrapper from './Wrapper';

test('Render Landing, Question page correctly', async () => {
  render(<App />, { wrapper: Wrapper });

  const RecommendButton = await screen.findByRole('button', {
    name: /추천받기/i,
  });

  expect(RecommendButton.innerHTML).toBe('추천받기');

  fireEvent.click(RecommendButton);

  expect(RecommendButton).not.toBeInTheDocument();

  const currentURL = window.location.href;

  expect(await screen.queryByText(/나이/)).toBeInTheDocument();
  expect(currentURL).toBe('http://localhost/recommend/question/1');
});
