/**
 * Observer pattern
 *
 ***/

let Subject = {
    _state: 0,
    _observers: [],
    add: function(...observers) {
        this._observers = this._observers.concat(observers);
    },
    getState: function() {
        return this._state;
    },
    setState: function(value) {
        this._state = value;
        for (let i = 0; i < this._observers.length; i++) {
            this._observers[i].signal(this);
        }
    }
};

class Observer {
    currentState;
    constructor() {}

    signal(subject) {
        this.currentState = subject.getState();
        console.log(this.currentState);
    }
}

/*** ----- ***/
