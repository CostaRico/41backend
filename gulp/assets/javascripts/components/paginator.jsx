var React = require('react');

var Li = React.createClass({
    displayName: 'Li',
    render() {
        return (
            <li><a href="#">{this.props.data.name}</a></li>
        );
    }
});

module.exports = React.createClass({
  getInitialState: function () {
      return { perPage:10, count: 0 };
    },
  render: function () {
    return (
      <nav>
        <ul className="pagination">
          <li>
            <a href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li>
            <a href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
      );
  }
});

// module.exports = Li;
