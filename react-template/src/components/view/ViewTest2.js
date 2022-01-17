import { useState, useEffect } from 'react';

const ViewTest2 = () => {
  console.log('Created and Updated');
  const [num, setNum] = useState(0);
  const [num2, setNum2] = useState(0);

  useEffect(() => {
    console.log('Watch');
    console.log(num);
  }, [num]);

  useEffect(() => {
    console.log('Watch all');
    console.log(num, num2);
  });

  return (
    <div className='view-test-2'>
      <p>You clicked {num} times</p>
      <button onClick={() => setNum(num + 1)}>Click me</button>
      <button onClick={() => setNum2(num2 + 1)}>Click Num2</button>
    </div>
  );
};

export default ViewTest2;
