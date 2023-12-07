/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {SafeAreaView, Text, StyleSheet} from 'react-native';

const App = () => {
  return (
    <SafeAreaView style={styles.body}>
      <Text style={styles.title}>Genie Demo App</Text>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  body: {
    flex: 1,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {fontSize: 24, fontWeight: 'bold'},
});

export default App;
