var React = require('react');
var Product = require('./product');

module.exports = React.createClass({
    loadProductssFromServer: function() {
      $.ajax({
        url: this.props.url,
        dataType: 'json',
        cache: false,
        success: data => {
          this.setState({data: data[0], page: data[1]});
          console.log('1')
        }.bind(this),
        error: function(xhr, status, err) {
          console.error(this.props.url, status, err.toString());
        }.bind(this)
      });
    },
    getInitialState: function () {
      return { data:[] };
    },
    componentWillMount: function() {
      this.loadProductssFromServer();
    },
    render: function () {
      var ProductList = this.state.data.map(function(product) {
        return (
          <Product data={product} key={product.id} />
        );
      });
      return <div className="row list-group" id="products">{ProductList}</div>;
    }
});
