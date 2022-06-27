import React, {useEffect} from 'react';
import {View, Text, StyleSheet, Button} from 'react-native';
import {NativeModules,NativeEventEmitter} from 'react-native';
const { Navigation } = NativeModules;
//const eventEmitter = new NativeEventEmitter(NativeView);




// console.log(NativeModules.Counter);
// NativeModules.Counter.increment(value => {
//   console.log('the count is ' + value);
// });
// console.log(NativeModules.Counter.getConstants());

//const CounterEvents = new NativeEventEmitter(NativeModules.Counter);

const App = props => {


  
  useEffect(() => {

    // const onSessionConnect = (event) => {
    //   console.log(event);
    // }
    // eventEmitter.addListener('EventReminder', this.handleAwesomeEvents, this);
    // handleAwesomeEvents = (event) => {
    //   console.log("SHENU GUPTA");
     // let awesomeness = event.awesomeRating;
  
      // if you don't provide context in didMount,
      // "this" will not refer to the component,
      // and this next line will throw
     // this.setState({ awesomeness });
  //};
   //  const subscription = eventEmitter.addListener('EventReminder', onSessionConnect);
    // EventEmitteriOS.addListener('onSessionConnect', result =>
    //   console.log('onSessionEvent Received received', result),
    // );
  //   CounterEvents.addListener('onDecrement', result =>
  //     console.log('onDecrement received', result),
  //   );
  // eventEmitter.addListener('EventReminder', result =>
  //   console.log('NativeiOSToReactNative SHENU', result),
  // );

    return () => {
      //eventEmitter.removeAllListeners();
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text>App</Text>
   

      <Button title="Decrease Count" onPress={navigateToNative} />
    </View>
  );

  // const decrement = async () => {
  //   try {
  //     var result = await NativeModules.Counter.decrement();
  //     console.log(result);
  //   } catch (e) {
  //     console.log(e.message, e.code);
  //   }
  // };
  // const increment = async () => {
  //   NativeModules.Counter.increment(res => console.log(res));
  // };

  
  }

    const navigateToNative = () => {
        console.log('react called');
        NativeModules.Navigation.navigateTo('NativeDemo');
      // };
   //   NativeModules.Counter.increment(res => console.log(res));
       // NativeModules.NativeView.changeToNativeView(res => console.log(res));;
      };
    

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;


//<Button title="Increase Count" onPress={NativeModules.NativeView.changeToNativeView} />

