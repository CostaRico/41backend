var React = require('react');

module.exports = React.createClass({
    getInitialState: function () {
        return {isLogged: false};
    },
    componentWillMount: function() {
        UserStore.addChangeListener(this._onChange);
        $.ajax({
            method: "GET",
            url: "/auth/is_signed_in.json"
        })
            .done(function (data) {
                UserActions.setUserState(data);
            }.bind(this));
    },
    propTypes: {
        signedIn: React.PropTypes.bool
    },
    _onChange(data){
        var signedIn = UserStore.getData().signed_in;
        this.setState({isLogged: signedIn})

    },
    getInitialState: function () {
        return {signedIn: null};
    },
    enterClicked(event){
        var div =$('.select-provider');
        if(div.is(':visible')){
            div.hide('fast');
        }else{
            div.show('fast');
        }
    },
    facebookLogin(){

        Toastr.options  = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-bottom-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        FB.login(function(response) {
            if (response.authResponse) {
                //console.log('Welcome!  Fetching your information.... ');
                FB.api('/me', function(response) {
                    console.log(response);
                    //console.log('Good to see you, ' + response.name + '.');
                    $.get('/users/auth/facebook', ()=>{
                        Toastr.info(response.name+', вы вошли.');
                    });
                    Toastr.info(response.name+', вы вошли.', ()=>{
                        alert('!');
                    });
                });
            } else {
                Toastr.error('Во время авторизации произошла ошибка, мы уже работаем над ее устранением!');
                //console.log('User cancelled login or did not fully authorize.');
            }

        });
    },
    render: function () {
        if (this.state.isLogged) {
            return <div>
                <a className="enter" href="">выйти</a>
            </div>;
        } else {
            return <div><a className="enter" onClick={this.enterClicked} href="#">войти</a>
                <div className="select-provider">
                    Выберите удобный способ:
                    <ul className="list-inline">
                        <li>
                            <a onClick={this.facebookLogin} href="#">
                                <img src="/i/fb.png" />
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="/i/fb.png" />
                            </a>
                        </li>
                    </ul>
                </div>
            </div>;
        }

    }
});
