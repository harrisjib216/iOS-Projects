import React from 'react';
import { Text } from 'react-native';

export const Score = ({ score }) => {
	return (
		<Text
			style={{
				top: 72,
				right: 36,
				fontSize: 28,
				fontWeight: 'bold',
				position: 'absolute',
			}}
		>
			{score}
		</Text>
	);
};
