React = require('react');

Comp1 = React.createClass({
    render: function(){
        return React.DOM.div({id: "comp1", className: "test"}, "testDiv")
    }
});

module.exports = Comp1