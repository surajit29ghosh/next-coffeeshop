import React from "react";

import LeftMenu from "../components/LeftMenu";
import ProductsPage from "../components/ProductsPage";
import RightBar from "../components/RightBar";

function Home() {
    return (
        <>
      <ProductsPage></ProductsPage>

      <RightBar></RightBar>
      </>
    );
}

export default Home;