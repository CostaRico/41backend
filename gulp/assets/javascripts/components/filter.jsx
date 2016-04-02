var React = require('react');
var Select = require('./inputs/color_picker');
module.exports = React.createClass({
    getDefaultProps: function () {
        return {
            items: [
                {
                    id: 1,
                    name: 'стартер-кит'
                },
                {
                    id: 2,
                    name: 'мод'
                },
                {
                    id: 3,
                    name: 'атомайзер'
                },
                {
                    id: 4,
                    name: 'EGO'
                },
                {
                    id: 5,
                    name: 'жидкость'
                },
                {
                    id: 6,
                    name: 'проволока'
                },
                {
                    id: 7,
                    name: 'сменный испаритель'
                },
                {
                    id: 8,
                    name: 'другое'
                },
            ],
        };
    },
    getInitialState: function () {
        return {
            focused: -1,
            subfilters: []
        };
    },
    clicked: function (index) {
        if(index == this.state.focused){
            this.setState({focused: -1, subfilters: []}, ()=> {
                $('#filter > li').show('fast');
            });
        }else{
            this.props.load_callback( index+1, null );
            this.setState({focused: index}, ()=> {
                $.when($('#filter > li').not('.active')
                    .hide(200)).then(()=>{
                    $('.sub-filter').css('display', 'inline');
                    $('.sub-filter').css('opacity', 0);
                    $('.sub-filter').animate({opacity: 1}, 200);
                });
            });
            this.getCategoryOptions(index+1);
        }

    },

    getCategoryOptions: function (category_id) {
      $.ajax({
        url: 'categories/' + category_id,
        type: 'get',
        dataType: 'json',
        cache: false,
        success: function(data) {
          this.setState({subfilters: data});
          console.log(this.state);
        }.bind(this),
        error: function(xhr, status, err) {
          console.error(category_id, status, err.toString());
        }.bind(this)
      });
    },

    render: function () {
        var self = this;

        var subFilters = [];

              console.log(this.props);
        // console.log(options);

        if (self.state.focused > -1){
            this.state.subfilters.map(function(hash) {
              subFilters.push(<Select
                  name="form-field-name"
                  options={hash.values}
                  placeholder={hash.name}
                  index={this.state.focused}
                  load_callback={this.props.load_callback}
              />);

            }.bind(this))
        }


        return <ul id="filter" className="list-inline">
            {
                this.props.items.map(function (m, index) {
                    var style = '';
                    var isActive = (self.state.focused == index);
                    if (isActive) {
                        style = 'active';
                    }
                    if (self.state.focused == index + 1) {
                        style = 'before-active';
                    }

                    if (isActive) {
                        return (<li key={m.id} onClick={self.clicked.bind(self, index)} className={style}>
                            <a href="#" onClick={self.clicked.bind(self, index)} className="back-button">
                                <span className="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
                            </a>
                            <a href="#">{m.name}</a>
                        </li>)



                    } else {
                        return (<li key={m.id} onClick={self.clicked.bind(self, index)} className={style}>
                            <a href="#">{m.name}</a>
                        </li>)
                    }
                })

            }
            {subFilters.map((m, index)=>{
                return m;
            })}

        </ul>
    }
});
