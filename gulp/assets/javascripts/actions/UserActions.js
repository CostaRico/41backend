/**
 * Created by Costa on 08.01.16.
 */


var AppDispatcher = require('../AppDispatcher');
var UserConstants = require('../constants/user_constants');

var UserActions = {

    /**
     * @param  {string} text
     */
    setUserState: function(data) {
        AppDispatcher.dispatch({
            actionType: UserConstants.USER_INFO_COMPLETE,
            data: data
        });
    }

};

module.exports = UserActions;
