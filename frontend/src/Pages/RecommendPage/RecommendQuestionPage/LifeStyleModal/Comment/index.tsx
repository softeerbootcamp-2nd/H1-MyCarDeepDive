interface CommentProps {
  comment: string;
}

function Comment({ comment }: CommentProps) {
  return (
    <div className='h-[80px] mt-5 mb-8 rounded bg-secondary bg-opacity-10 font-body2-medium text-secondary whitespace-pre flex items-center justify-center text-center'>
      {comment}
    </div>
  );
}

export default Comment;
