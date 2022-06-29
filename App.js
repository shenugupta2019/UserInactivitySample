import React, {useEffect} from 'react';
import {View, Text, StyleSheet, Button} from 'react-native';
import {NativeModules,NativeEventEmitter }from 'react-native';
const eventEmitter = new NativeEventEmitter(NativeModules.IdleTouchDetect);



const  startGlobalService = () => {
  const touchService = NativeModules.IdleTouchDetect;
  touchService.startService();
  };

// 

const App = props => {
  useEffect(() => {
    eventEmitter.addListener('testEvent', result =>
    console.log('NativeiOSToReactNative SHENU', result),
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
      <Button title="Increase Count" onPress={startGlobalService
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
