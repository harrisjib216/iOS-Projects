import React, { Component } from 'react';
import { Platform, ScrollView, StyleSheet, View, Text, Image, Modal, TouchableOpacity, Dimensions } from 'react-native';
import Navbar from './../components/navbar';
import Swiper from 'react-native-swiper';
import Web from './Web';
const {width, height} = Dimensions.get('window');


// class
class Extras extends Component {
  constructor(props) {
    super(props);
    this.state = {
      link: '',
      linkModal: false
    }


    this._closeModal = this._closeModal.bind(this);
  }


  // render
  render() {
    return (
      <ScrollView contentContainerStyle={styles.container}>
        {/* navbar */}
        <Navbar screenTitle={'Extras'} />


        {/* pictures of Jesse Jones */}
        <Image style={styles.badgeCont} source={require('./../components/*images/badge.png')}/>
        <View style={styles.swiperCont}>
          <Swiper style={styles.badgeSwiper} showsPagination={false} autoplay={true} autoplayTimeout={1.5}>
            <Image style={styles.badgeImgs} source={require('./../components/*images/one.png')}/>
            <Image style={styles.badgeImgs} source={require('./../components/*images/two.png')}/>
            <Image style={styles.badgeImgs} source={require('./../components/*images/three.png')}/>
            <Image style={styles.badgeImgs} source={require('./../components/*images/four.png')}/>
            <Image style={styles.badgeImgs} source={require('./../components/*images/five.png')}/>
            <Image style={styles.badgeImgs} source={require('./../components/*images/six.png')}/>
          </Swiper>
        </View>


        {/* name label */}
        <Text style={styles.badgeName}>Jesse Jones</Text>
        <Text style={styles.badgeText}>Filayyyy Movement, LLC</Text>


        {/* bio field */}
        <Text style={styles.bioLabel}>About me</Text>
        <View style={styles.bioContainer}>
          <ScrollView>
            <Text style={styles.bioName}>Mr. SkipThruDatLane</Text>
            <Text style={styles.bioText}>My name Is Jesse Jones and I'm from Irvington, NJ. I’m  hooper, entertainer, and an Influencer!! Always Believe In You, Sky’s The Limit</Text>
            <Text style={styles.bioText}>I started the filayyyy movement two years ago. At first, it was just "filet", but as people started to follow me and follow the movement it became "filayyyy". It started from me being a singer back in the day, my mom, my dad, my brother, pretty much my whole family could sing, so that's why I sing "filayyyy" over my videos. I heard a lot of people say "filet/filay" so I just wondered "How can I be different?" so I create my own little word and I kept going. What made it unique was that I could sing on top of playing basketball. One day, I was in my room with my girlfriend watching the finals and I saw Curry hit a move, so I recorded it and put my voice over it and it sounded great. I posted it on Instagram and it got a bunch of comments and likes so I kept doing it. After I graduated college, I put more time into it and it just kept moving.</Text>
          </ScrollView>
        </View>
    

        {/* credits to graphics */}
        <Text style={styles.creditsLabel}>Credits</Text>
        <View style={styles.creditsContainer}>
          {/* ifaa */}
          <Text style={styles.creditsText1}>Developed by IFAA, LCC</Text>
          <Text style={styles.creditsSub}>Get your project built by IFAA</Text>
          <TouchableOpacity onPress={() => this.setState({link: 'http://ifaadev.com', linkModal: true})}>
            <Text style={styles.creditsLink}>www.ifaadev.com</Text>
          </TouchableOpacity>


          {/* graphics */}
          <Text style={styles.creditsText2}>Graphics made by Today's Business</Text>
          <Text style={styles.creditsSub}>Get your graphics made by Today's Business</Text>
          <TouchableOpacity onPress={() => this.setState({link: 'http://ifaadev.com', linkModal: true})}>
            <Text style={styles.creditsLink}>www.tbsmo.com</Text>
          </TouchableOpacity>
        </View>


        {/* link modal */}
        <Modal visible={this.state.linkModal} animationType={'slide'} transparent={true}>
          <Web close={this._closeModal} url={this.state.link} />
        </Modal>
      </ScrollView>
    );
  }


  // exit link modal
  _closeModal() {
    this.setState({linkModal: false});
  }
}


// styling
const styles = StyleSheet.create({
  container: {
    backgroundColor: '#DCE2E5'
  },


  // badge
  badgeCont: {
    width: width,
    height: width / 1.4
  },
  swiperCont: {
    top: 120,
    left: width / 4.2,
    position: 'absolute'
  },
  badgeSwiper: {
    height: 220
  },
  badgeImgs: {
    width: 200,
    height: 220,
    borderRadius: 10
  },
  badgeName: {
    fontSize: 38,
    marginTop: 20,
    color: '#2F3030',
    fontWeight: '800',
    alignSelf: 'center'
  },
  badgeText: {
    fontSize: 16,
    marginTop: 5,
    color: '#7E8E93',
    fontWeight: '700',
    alignSelf: 'center'
  },


  // bio
  bioLabel: {
    fontSize: 26,
    marginTop: 50,
    marginLeft: 20,
    color: '#757575',
    fontWeight: '700'
  },
  bioContainer: {
    height: 400,
    marginTop: 10,
    marginBottom: 80,
    width: width * 0.9,
    alignSelf: 'center',
    backgroundColor: '#F8F9FB'
  },
  bioName: {
    marginTop: 8,
    fontSize: 18,
    paddingLeft: 12,
    paddingRight: 12,
    fontWeight: '700'
  },
  bioText: {
    marginTop: 8,
    paddingLeft: 12,
    paddingRight: 12,
    fontWeight: '600'
  },


  // credits
  creditsLabel: {
    fontSize: 28,
    marginLeft: 20,
    color: '#757575',
    fontWeight: '700'
  },
  creditsContainer: {
    height: 300,
    marginTop: 10,
    marginBottom: 80,
    width: width * 0.9,
    alignSelf: 'center',
    backgroundColor: '#F8F9FB'
  },
  creditsText1: {
    fontSize: 22,
    marginTop: 10,
    paddingLeft: 12,
    color: '#757575',
    fontWeight: '700'
  },
  creditsSub: {
    fontSize: 18,
    marginTop: 8,
    paddingLeft: 12,
    paddingRight: 12,
    fontWeight: '600'
  },
  creditsLink: {
    fontSize: 16,
    marginTop: 8,
    paddingLeft: 12,
    paddingRight: 12,
    color: '#42a5f5',
    fontWeight: '600'
  },
  creditsText2: {
    fontSize: 22,
    marginTop: 40,
    paddingLeft: 12,
    color: '#757575',
    fontWeight: '700'
  }
});


// export
export default Extras;