import React from "react";

function Orders() {
    return(
        <div className="flex-grow flex">
          <div className="flex flex-col bg-blue-gray-50 h-full w-full py-4">
            <div className="h-full overflow-hidden mt-4">
              <div className="h-full overflow-y-auto px-2">
                <div
                  className="flex mb-3 text-3xl font-semibold text-blue-gray-700"
                >
                  <div>Order Pages</div>
                </div>
                <div>
                  <table className="w-screen md:table-fixed">
                    <thead>
                      <tr>
                        <th className="py-1 text-center">#</th>
                        <th className="py-1 text-center">Location</th>
                        <th className="py-1 text-center">Status</th>
                        <th className="py-1 text-left">Items</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
    );
}

export default Orders;