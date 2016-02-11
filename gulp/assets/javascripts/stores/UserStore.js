/*
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * TodoStore
 */

var AppDispatcher = require('../AppDispatcher');
var EventEmitter = require('events').EventEmitter;
var UserConstants = require('../constants/user_constants');
var assign = require('object-assign');


var _userInfo = {};

var CHANGE_EVENT = 'change';
/**
 * Delete all the completed TODO items.
 */
function destroyCompleted() {
    for (var id in _todos) {
        if (_todos[id].complete) {
            destroy(id);
        }
    }
}

var UserStore = assign({}, EventEmitter.prototype, {

    setData(data) {
        _userInfo = data;
    },

    getData(){
        return _userInfo;
    },

    emitChange: function() {
        this.emit(CHANGE_EVENT);
    },

    /**
     * @param {function} callback
     */
    addChangeListener: function (callback) {
        this.on(CHANGE_EVENT, callback);
    },

    /**
     * @param {function} callback
     */
    removeChangeListener: function (callback) {
        this.removeListener(CHANGE_EVENT, callback);
    }
});

// Register callback to handle all updates
AppDispatcher.register(function (action) {
    var text;

    switch (action.actionType) {
        case UserConstants.USER_INFO_COMPLETE:

            var data = action.data;
            UserStore.setData(data);
            UserStore.emitChange();
            break;

        default:
        // no op
    }
});

module.exports = UserStore;
