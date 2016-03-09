// console.log('4');
var React = require('react');
var ReactDOM = require('react-dom');
var Product = require('./product');
var Filter = require('./filter');
// var Paginator = require('./paginator');

module.exports = React.createClass({
    loadProductssFromServer: function(category_id) {
      $.ajax({
        url: this.props.url,
        type: 'get',
        data: { 'category_id': category_id },
        dataType: 'json',
        cache: false,
        success: function(data) {
          this.setState({data: data[0], page: data[1]});
        }.bind(this),
        error: function(xhr, status, err) {
          console.error(this.props.url, status, err.toString());
        }.bind(this)
      });
    },
    getInitialState: function () {
      return { data:[], count:'0' };
    },
    componentWillMount: function() {
      this.loadProductssFromServer(0);
      ReactDOM.render(
         <Filter load={this.loadProductssFromServer} />,
         document.getElementById('vape-filter')
      );

    },
    render: function () {
      var ProductList = this.state.data.map(function(product) {
        return (
          <Product data={product} key={product.id} />
        );
      });
      return (
        <div className="row list-group" id="products">
          {ProductList}
        </div>
        );
    }
});
