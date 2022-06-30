import React, {useEffect} from 'react';
import {View, Text, StyleSheet, Button,Alert} from 'react-native';
import {NativeModules,NativeEventEmitter }from 'react-native';
const eventEmitter = new NativeEventEmitter(NativeModules.IdleTouchDetect);



const  startGlobalService = () => {
  const touchService = NativeModules.IdleTouchDetect;
  touchService.startService();
  Alert.alert('User Tracking service started');
  };

  const  navigateToiOSScreen = () => {
    const navigation = NativeModules.Navigation;
    navigation.navigateTo('iOSScreen');
    };

    const  stopTrackingService = () => {
      const touchService = NativeModules.IdleTouchDetect;
      touchService.stopService();
      Alert.alert('User Tracking service stopped');
      };

// 

const App = props => {
  useEffect(() => {
    eventEmitter.addListener('timeoutEvent', result =>
    Alert.alert('User Tracking session timeout'),
    //console.log('Timeout Session', result),
    // setTimeout(() => {
    //   Alert.alert('User Tracking session timeout');
    // }, 100),

  );

  eventEmitter.addListener('serviceStopped', result =>
  Alert.alert('User Tracking session stopped'),
  //console.log('service stopped', result),
);

eventEmitter.addListener('serviceStarted', result =>
console.log('service started', result),
);
   

    return () => {
     eventEmitter.removeAllListeners();
    };
  }, []);


  

  

  // const idleDetect = async () => {
  //   NativeModules.RCTEmitter.sendTest(res => console.log(res));
  // };

  return (
    <View style={styles.container}>
      <Text>App</Text>
      <Button title="Start Tracking Service" onPress={startGlobalService
      } />
        <Button title="Navigate To IOS View" onPress={navigateToiOSScreen
      } />
       <Button title="Stop Tracking Service" onPress={stopTrackingService
      } />

    </View>
  );
};
export default App;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
