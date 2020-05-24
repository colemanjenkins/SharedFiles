import React, { Component } from "react";
import "./OrderForm.css";
import { isEmpty } from "lodash";

class OrderForm extends Component {
    constructor(props) {
        super(props);
        this.state = {
            //initial state
            orders: [
            ]
        };

    }

    render() {
        //commonly put functions that are manipulating the UI
        //in render, not before (though it would work before in the class)
        let totalCost = !isEmpty(this.props.orders) && this.props.orders
            .map(order => order.price)
            .reduce((prev, next) => prev + next);

        return <div className="formBody">
            {console.log("Total cost: ", totalCost)}
            <div className="formTitle">OrderForm</div>
            <div>
                {this.props.orders.map(order => {
                    return (
                        <div>
                            <h2 className="orderElementsTitle">{order.title}</h2>
                            <h6 className="orderElementsPrice">{" " + order.price}</h6>
                            <button className="removeButton" onClick={() => this.props.handleRemoveOrder(order)}>Remove</button>
                            <div>{" "}</div>
                        </div>
                    );
                })

                }
            </div>
            <div className="total">Total cost: {totalCost}</div>
        </div >;
    }
}

export default OrderForm;