import React, { Component } from 'react';
import { StyleSheet, View, Text, Dimensions } from 'react-native';
const {width} = Dimensions.get('window');



// class
class Navbar extends Component {
  constructor(props) {
    super(props);
  }


  // render
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.screenLabel}>{this.props.screenTitle}</Text>
      </View>
    );
  }
}


// styling
const styles = StyleSheet.create({
  container: {
    height: 100,
    width: width,
    justifyContent: 'center',
    backgroundColor: '#F2F3F5'
  },
  screenLabel: {
    fontSize: 32,
    marginTop: 10,
    marginLeft: 30,
    color: '#2F3030',
    fontWeight: '800'
  }
});



// export
export default Navbar;