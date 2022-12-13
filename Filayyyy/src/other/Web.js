import React, { Component } from 'react';
import { StyleSheet, View, Text, Dimensions, TouchableOpacity, Image, WebView } from 'react-native';
const {width, height} = Dimensions.get('window');


// class
class Web extends Component {
  constructor(props) {
    super(props);
  }


  // render
  render() {
    return (
      <View style={styles.container}>
        {/* web view */}
        <WebView
          style={styles.webview}
          javaScriptEnabled={true}
          domStorageEnabled={true}
          startInLoadingState={true}
          decelerationRate={"normal"}
          automaticallyAdjustContentInsets={false}
          source={{uri: this.props.url}}
        />


        {/* cancel button */}
        <TouchableOpacity onPress={this.props.close}>
          <Image style={styles.cancelBtn} source={require('./../components/*images/cancelBtn.png')} />
        </TouchableOpacity>
      </View>
    );
  }
}


// styling
const styles = StyleSheet.create({
  container: {
    width: width,
    opacity: 0.85,
    height: height,
    backgroundColor: '#616161'
  },
  cancelBtn: {
    width: 40,
    height: 40,
    marginLeft: 5,
    marginTop: -height * 0.99
  },
  webview: {
    marginTop: 10,
    height: height,
    alignSelf: 'center',
    width: width * 0.95
  }
});


// export
export default Web;