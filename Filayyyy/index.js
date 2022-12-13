import React, { Component } from 'react';
import { AppRegistry } from 'react-native';
import { DrawerNavigator } from 'react-navigation';
import SoundBoard from './src/main/SoundBoard';
import Shop from './src/main/Shop';
import Twitter from './src/feed/Twitter';
import Instagram from './src/feed/Instagram';
import Extras from './src/other/Extras';


// class
export default class Filayyyy extends Component {
  render() {
    const { navigation } = this.props;
    return (
      <SoundBoard navigation={ navigation } />
    );
  }
}


// routes
const Routes = DrawerNavigator({
  SoundBoard: {screen: SoundBoard},
  Shop: {screen: Shop},
  Instagram: {screen: Instagram},
  Twitter: {screen: Twitter},
  Extras: {screen: Extras}
});


// export
AppRegistry.registerComponent('filayyyy', () => Routes);