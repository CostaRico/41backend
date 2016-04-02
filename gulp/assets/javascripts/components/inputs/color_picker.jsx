var React = require('React');
var ReactDOM = require('react-dom');
var Select2 = require('select2');

module.exports = React.createClass({
    ajax: function() {
        console.log('seleted');
        return $.map( $("select"), function( val, i ) {
          return $(val).select2('data')[0].id;
        });
    },

    selectedOption: function() {
      this.props.load_callback( this.props.index+1, this.ajax );
    },

    componentDidMount: function() {
        $(ReactDOM.findDOMNode(this)).find('select').select2({
            placeholder: this.props.placeholder,
            width: 150
        }).on('change', this.selectedOption);
    },

    render: function () {

        return <li className="sub-filter select">
            <select className="js-example-basic-multiple">
                <option></option>
              {this.props.options.map(option =>
                <option value={option.id}>
                    {option.value}
                </option>
              )}
            </select>
        </li>;
    }
});



      $.map( $("select"), function( val, i ) {
          return $(val).select2('data')[0].id;
        });
