React = require('react');

Comp1 = React.createClass({
    render: function(){
        return React.DOM.span({id: "comp2", className: "test2"}, "testSpan")
    }
});

module.exports = Comp1