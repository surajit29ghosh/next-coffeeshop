import React from "react";

function Payment() {
    return (
        <div className="select-none h-auto w-full text-center pt-3 pb-4 px-4">
            <div className="flex mb-3 text-lg font-semibold text-blue-gray-700">
                <div>TOTAL</div>
                <div className="text-right w-full"
                ></div>
            </div>
            <div
                className="mb-3 text-blue-gray-700 px-3 pt-2 pb-3 rounded-lg bg-blue-gray-50"
            >
                <div className="flex text-lg font-semibold">
                    <div className="flex-grow text-left">CASH</div>
                    <div className="flex text-right">
                        <div className="mr-2">USD</div>
                        <input
                            type="text"
                            className="w-28 text-right bg-white shadow rounded-lg focus:bg-white focus:shadow-lg px-2 focus:outline-none"
                        />
                    </div>
                </div>
                <hr className="my-2" />
                <div className="grid grid-cols-3 gap-2 mt-2">
                    <template x-for="money in moneys">
                        <button
                            className="bg-white rounded-lg shadow hover:shadow-lg focus:outline-none inline-block px-2 py-1 text-sm"
                        >
                            +<span x-text="numberFormat(money)"></span>
                        </button>
                    </template>
                </div>
            </div>
            <div
                x-show="change > 0"
                className="flex mb-3 text-lg font-semibold bg-cyan-50 text-blue-gray-700 rounded-lg py-2 px-3"
            >
                <div className="text-cyan-800">CHANGE</div>
                <div
                    className="text-right flex-grow text-cyan-600"
                ></div>
            </div>
            <div
                className="flex mb-3 text-lg font-semibold bg-pink-100 text-blue-gray-700 rounded-lg py-2 px-3"
            >
                <div
                    className="text-right flex-grow text-pink-600"
                    x-text="priceFormat(change)"
                ></div>
            </div>
            <div
                x-show="change == 0 && cart.length > 0"
                className="flex justify-center mb-3 text-lg font-semibold bg-cyan-50 text-cyan-700 rounded-lg py-2 px-3"
            >
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="h-6 w-6 inline-block"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                >
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M14 10h4.764a2 2 0 011.789 2.894l-3.5 7A2 2 0 0115.263 21h-4.017c-.163 0-.326-.02-.485-.06L7 20m7-10V5a2 2 0 00-2-2h-.095c-.5 0-.905.405-.905.905 0 .714-.211 1.412-.608 2.006L7 11v9m7-10h-2M7 20H5a2 2 0 01-2-2v-6a2 2 0 012-2h2.5"
                    />
                </svg>
            </div>
            <button className="text-white rounded-2xl text-lg w-full py-3 focus:outline-none">SUBMIT</button>
        </div>
    );
}

export default Payment;