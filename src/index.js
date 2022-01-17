import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import ViewHome from './components/view/ViewHome';
import ViewTest2 from './components/view/ViewTest2';
import './index.css';
import reportWebVitals from './reportWebVitals';

ReactDOM.render(
  <BrowserRouter>
  <Link to='/'>home</Link>
    <Link to='/test2'>test2</Link>
    <Routes>
      <Route path='/' element={<ViewHome />}></Route>
      <Route path='/test2' element={<ViewTest2 />}></Route>
    </Routes>
  </BrowserRouter>,
  document.getElementById('root')
);

reportWebVitals();
