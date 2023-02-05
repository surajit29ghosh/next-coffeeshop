import React from "react";
import CartItems from "./CartItems";
import Payment from "./Payment";

function RightBar() {
    return (
        
        <div
          className="w-5/12 flex flex-col bg-blue-gray-50 h-full bg-white pr-4 pl-2 py-4"
        >
          <div className="bg-white rounded-3xl flex flex-col h-full shadow">
            <div
              x-show="cart.length === 0"
              className="flex-1 w-full p-4 opacity-25 select-none flex flex-col flex-wrap content-center justify-center"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="h-16 inline-block"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"
                />
              </svg>
              <p>CART EMPTY</p>
            </div>

            <CartItems></CartItems>

            <Payment></Payment>
          </div>
        </div>
    );
}

export default RightBar;