/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';
import {NativeModules,NativeEventEmitter} from 'react-native';
import React, { Component } from 'react';
import {
    View,
    Text,
} from 'react-native';


export default class DemoApp extends Component {
state = {
    nativeModuleText: null
}
componentWillMount() {
    // eventEmitter.addListener('EventReminder', result =>
    //      console.log('onDecrement received', result),
    //    );
}
componentWillUnmount() {
   // eventEmitter.remove();
}

    render() {
        return (
            <View><Text>Hello world</Text></View>
        );
    }
}

AppRegistry.registerComponent(appName, () => App);


// Unless you are exporting multiple things from a single file, you should just use this.
// It's more idiomatic than using module.exports = ReactApp;



