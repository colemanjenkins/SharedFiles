import React, { Component } from 'react';
import './App.css';
import Menu from "./menu.js";
import OrderForm from "./OrderForm.js";
// import Button from "./Button.js"

//also functional component

class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      orders: []
    };
  }

  handleAddToOrder = course => {
    this.setState((preState => {
      return { orders: [...preState.orders, course] };
    }))
  }

  handleRemoveOrder = course => {
    const newOrders = this.state.orders.filter(
      order => order.title !== course.title
    );
    this.setState(prevState => {
      return { orders: newOrders };
    });
  }

  render() {
    return (
      <div style={{ display: "flex" }}>
        {console.log("orders", this.state.orders)}
        <div style={{ flex: "2" }}>
          {/* common practce to name same thing, different in reality tho */}
          <Menu handleAddToOrder={this.handleAddToOrder} />
        </div>
        <div style={{ flex: "1" }}>
          <OrderForm orders={this.state.orders} handleRemoveOrder={this.handleRemoveOrder} />
        </div>
        {/* <Button /> */}
      </div>
    );
  }
};
// function App() {
//   return (
//     /*Menu takes up twice as much space as OrderForm
//     {{}} - inner one holds actual object pairs
//     JSX syntax
//       - combo of HTML, CSS and JS all together in one easy way
//       - unique react syntax
//     */
//     <div style={{ display: "flex" }}>
//       <div style={{ flex: "2" }}>
//         <Menu />
//       </div>
//       <div style={{ flex: "1" }}>
//         <OrderForm />
//       </div>
//       {/* <Button /> */}
//     </div>

//   );
// }

/*
flex:
  will try and squeeze everything it holds into one line
  -proportional system
 
*/

export default App;
