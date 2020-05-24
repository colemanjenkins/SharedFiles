import React, { Component } from "react";

class Button extends Component {
    constructor(props) {
        super(props);
        this.state = {
            value: 1
        }
    }

    handleButtonClick = () => {
        // setState updates the state
        this.setState(prevState => {
            return { value: prevState.value + 1 };
        });
    };

    render() {
        return (
            <div style={{ marginLeft: "10px" }}>
                {this.state.value}
                <button onClick={() => this.handleButtonClick()}>Click Me!</button>
            </div >
        );
    }
}

export default Button;