import React from 'react';
import { View, Text } from 'react-native';

export const Overlay = ({ onTouchStart, title = '', subTitle = '', footer = '' }) => {
    return (
        <View
            style={{
                opacity: 0.5,
                width: '100%',
                height: '100%',
                position: 'relative',
                alignItems: 'center',
                backgroundColor: '#212121',
            }}
            onTouchStart={onTouchStart}
        >
            {/* game over message */}
            <Text
                style={{
                    fontSize: 36,
                    color: 'white',
                    marginTop: 175,
                    fontWeight: '700',
                }}
            >
                {title}
            </Text>

            {/* final score */}
            <Text
                style={{
                    fontSize: 18,
                    marginTop: 15,
                    color: 'white',
                    fontWeight: '500'
                }}
            >
                {subTitle}
            </Text>

            {/* play again */}
            <Text
                style={{
                    bottom: 150,
                    fontSize: 24,
                    color: 'white',
                    fontWeight: '500',
                    position: 'absolute',
                }}
            >
                {footer}
            </Text>
        </View>
    )
}