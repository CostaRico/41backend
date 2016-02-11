var React = require('React');
var ReactDOM = require('react-dom');
require('select2');
module.exports = React.createClass({
    componentDidMount: function() {
        $(ReactDOM.findDOMNode(this)).find('select').select2({
            placeholder: 'цвет',
            width: 150
        });
    },

    render: function () {

        return <li className="sub-filter select">
            <select className="js-example-basic-multiple">
                <option value="A4">синий</option>
                <option value="A1">красный</option>
                <option value="A2">зеленый</option>
                <option value="A5">черный</option>
                <option value="AL">бежевый</option>
                <option value="WY">другой</option>
            </select>
        </li>;
    }
});
