var React = require('react');

module.exports = React.createClass({
    render: function () {
      return (
          <div className="item  col-xs-4 col-lg-4">
              <div className="thumbnail">
                  <img className="group list-group-image" src="http://placehold.it/400x250/000/fff" alt="" />
                  <div className="caption">
                      <h4 className="group inner list-group-item-heading">{this.props.data.title}</h4>
                      <p className="group inner list-group-item-text">{this.props.data.text}</p>
                      <div className="row">
                          <div className="col-xs-12 col-md-6">
                              <p className="lead">{this.props.data.price}</p>
                          </div>
                          <div className="col-xs-12 col-md-6">
                              <a className="btn btn-success" href="http://www.jquery2dotnet.com">Add to cart</a>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      );
    }
});
