import React from 'react';
import { View } from 'react-native';

export const Bird = ({ height, width, birdLeft, birdBottom }) => {
	const birdHalf = height / 2;
	const left = birdLeft - birdHalf;
	const bottom = birdBottom - birdHalf;

	return (
		<View
			style={{
				left,
				width,
				height,
				bottom,
				position: 'absolute',
				backgroundColor: 'blue'
			}}
		/>
	);
};
