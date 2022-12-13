import React, { Component } from 'react';
import { Platform, StyleSheet, View, WebView, Dimensions } from 'react-native';
const {width, height} = Dimensions.get('window');



// class
class Instagram extends Component {
  constructor(props) {
    super(props);
  }


  // render
  render() {
    return (
      <View style={styles.container}>
        {/* instagram link */}
        <WebView
          style={styles.webview}
          source={{uri: 'https://www.instagram.com/filayyyy/?hl=en'}}
        />
      </View>
    );
  }
}


// styling
const styles = StyleSheet.create({
  container: {
    width: width,
    height: height
  },
  webview: {
    width: width,
    height: height
  }
});



// export
export default Instagram;