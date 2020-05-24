
//at head of every file
import React from "react";
import "./menu.css";

//functional conponent: does not contain state
//not controlling live parts of app ..?
// const Menu = () => /* arrow function syntax */{
//     return (
//         <div>
//             Coleman
//         </div>
//     )
// }

// const title = "Main course";
// const description = "Description of main course";
// const price = 10;

const mainCourses = [
    {
        title: "Main course 1",
        description: "description",
        price: 10
    },
    {
        title: "Main course 2",
        description: "description",
        price: 11
    },
    {
        title: "Main course 3",
        description: "description",
        price: 12
    },
    {
        title: "Main course 4",
        description: "description",
        price: 13
    },
    {
        title: "Main course 5",
        description: "description",
        price: 14
    }
];



const Menu = (props) => {
    return (
        <div>
            <div className="menuHeader">
                Website
            </div>
            <div style={{ display: "flex", flexWrap: "wrap", justifyContent: "center" }}>
                {/* mainCourses is argument to the map function */}
                {mainCourses.map(course => {
                    return (
                        <div className="menuItem">
                            {/* show that it's a variable, not txt */}
                            <h2>{course.title} </h2>
                            <h6>{course.description}</h6>
                            <h6>....................{course.price}</h6>
                            <div >
                                {" "}
                                <button className="menuButton"
                                    onClick={() => props.handleAddToOrder(course)}>
                                    Add to order
                                    </button>
                            </div>
                        </div>
                    );
                })}
            </div>
        </div>
    );
};

export default Menu;