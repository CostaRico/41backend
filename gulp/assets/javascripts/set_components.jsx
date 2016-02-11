 var React = require('react');
 var ReactDOM = require('react-dom');
 var LoginForm = require('./components/login_form');
 var Filter = require('./components/filter');


 var options = [
  { value: 'one', label: 'One' },
  { value: 'two', label: 'Two' }
 ];

 function logChange(val) {
  console.log("Selected: " + val);
 }

 UserActions = require('./actions/UserActions');
 UserStore = require('./stores/UserStore');

 ReactDOM.render(
     <LoginForm />,
     document.getElementById('login-form')
 );
 ReactDOM.render(
     <Filter />,
     document.getElementById('vape-filter')
 );

/*
 ReactDOM.render(
     <Select
         name="form-field-name"
         value="one"
         options={options}
         onChange={logChange}
     />,
     document.getElementById('select-test')
 );*/
