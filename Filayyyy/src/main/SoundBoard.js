import React, { Component } from 'react';
import { Platform, ScrollView, StyleSheet, View, FlatList, Text, Image, TouchableOpacity, Dimensions } from 'react-native';
import Navbar from './../components/navbar';
const SoundPlayer = require('react-native-sound');
const {width, height} = Dimensions.get('window');


// class
class SoundBoard extends Component {
  constructor(props) {
    super(props);
    this.state = {
      sounds: [
        {name: 'nothin', image: <Image style={styles.soundImg} source={require("./../components/*images/aintnothinovathere.png")}/>, sound: 'aintnothin'},
        {name: 'get two', image: <Image style={styles.soundImg} source={require("./../components/*images/canigettwo.png")}/>, sound: 'getthistwo'},
        {name: 'chakuummm', image: <Image style={styles.soundImg} source={require("./../components/*images/chakuummm.png")}/>, sound: 'chakuummm'},
        {name: 'dime', image: <Image style={styles.soundImg} source={require("./../components/*images/dime.png")}/>, sound: 'dime'},
        {name: 'hesi', image: <Image style={styles.soundImg} source={require("./../components/*images/hesi.png")}/>, sound: 'hesi'},
        {name: 'heyyy', image: <Image style={styles.soundImg} source={require("./../components/*images/heyyy.png")}/>, sound: 'heyyy'},
        {name: 'i lift', image: <Image style={styles.soundImg} source={require("./../components/*images/ilift.png")}/>, sound: 'ilift'},
        {name: 'layyyy', image: <Image style={styles.soundImg} source={require("./../components/*images/layyyy.png")}/>, sound: 'layyy'},
        {name: 'skip thru', image: <Image style={styles.soundImg} source={require("./../components/*images/skipthroughthatlane.png")}/>, sound: 'skipthru'},
        {name: 'snatch', image: <Image style={styles.soundImg} source={require("./../components/*images/snatch.png")}/>, sound: 'snatch'},
        {name: 'spin move', image: <Image style={styles.soundImg} source={require("./../components/*images/spinmove.png")}/>, sound: 'spinmove'},
        {name: 'tween', image: <Image style={styles.soundImg} source={require("./../components/*images/tween.png")}/>, sound: 'tween'},
        {name: 'wont get up', image: <Image style={styles.soundImg} source={require("./../components/*images/wontgetup.png")}/>, sound: 'wontgetup'}
      ]
    }


    this._playSound = this._playSound.bind(this);
  }


  // render
  render() {
    return (
      <ScrollView contentContainerStyle={styles.container}>
        {/* navbar */}
        <Navbar screenTitle={'filayyy'} />


        {/* sound buttons */}
        <FlatList
          data={this.state.sounds}
          contentContainerStyle={styles.soundList}
          renderItem={({item}) => this._renderSound(item)}
        />
      </ScrollView>
    );
  }


  // render sound
  _renderSound(item) {
    return (
      <TouchableOpacity style={styles.soundBtn} onPress={() => this._playSound(item.sound)}>
        {item.image}
        <Text style={styles.soundTitle}>{item.name}</Text>
      </TouchableOpacity>
    );
  }


  // play sound
  _playSound(soundPath) {
    var whoosh = new SoundPlayer(`${soundPath}.mp4`, SoundPlayer.MAIN_BUNDLE, (error) => {
      if (error) {
        console.log('failed to load the sound', error);
        return;
      }
      else {
        whoosh.play((success) => {
          if (success) {
            console.log('successfully finished playing');
          }
          else {
            alert('Could not play :(');
            whoosh.reset();
          }
        });
      }
    });
  }
}


// styling
const styles = StyleSheet.create({
  container: {
    backgroundColor: '#DCE2E5'
  },


  // sound feed
  soundList: {
    marginTop: 10,
    flexWrap: 'wrap',
    marginBottom: 80,
    flexDirection: 'row'
  },
  soundBtn: {
    margin: 1,
    height: 125,
    width: width * 0.32
  },
  soundImg: {
    width: 95,
    height: 95,
    alignSelf: 'center'
  },
  soundTitle: {
    fontSize: 15,
    color: '#7E8E93',
    fontWeight: '700',
    alignSelf: 'center'
  }
});


// export
export default SoundBoard;