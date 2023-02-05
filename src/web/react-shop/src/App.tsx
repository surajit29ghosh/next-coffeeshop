import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import './App.css';
import LeftMenu from './components/LeftMenu';
import ProductsPage from './components/ProductsPage';
import RightBar from './components/RightBar';
import Home from './pages/Home';
import Orders from './pages/Orders';

function App() {
  return (
    <div className="hide-print flex flex-row h-screen antialiased text-blue-gray-800">
      <LeftMenu></LeftMenu>

      <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/orders" element={<Orders />} />
      </Routes>
      </BrowserRouter>

    </div>
  );
}

export default App;
