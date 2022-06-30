import React, {useEffect} from 'react';
import {View, Text, StyleSheet, Button} from 'react-native';
import {NativeModules,NativeEventEmitter }from 'react-native';
const eventEmitter = new NativeEventEmitter(NativeModules.IdleTouchDetect);



const  startGlobalService = () => {
  const touchService = NativeModules.IdleTouchDetect;
  touchService.startService();
  };

  const  navigateToiOSScreen = () => {
    const navigation = NativeModules.Navigation;
    navigation.navigateTo('iOSScreen');
    };

    const  stopTrackingService = () => {
      const touchService = NativeModules.IdleTouchDetect;
      touchService.stopService();
      };

// 

const App = props => {
  useEffect(() => {
    eventEmitter.addListener('timeoutEvent', result =>
    console.log('Timeout NativeiOSToReactNative SHENU', result),
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
