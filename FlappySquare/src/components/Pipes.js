import React from 'react';
import { View } from 'react-native';

export const Pipes = ({ pipeLeft, pipeWidth, pipeHeight = 300, color }) => {
	return (
		<>
			<View
				style={{
					left: pipeLeft,
					top: 0,
					width: pipeWidth,
					height: pipeHeight,
					position: 'absolute',
					backgroundColor: color,
				}}
			/>

			<View
				style={{
					left: pipeLeft,
					bottom: 0,
					width: pipeWidth,
					height: pipeHeight,
					position: 'absolute',
					backgroundColor: color,
				}}
			/>
		</>
	);
};
