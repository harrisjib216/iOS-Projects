import React, { useEffect, useState } from 'react';
import { View } from 'react-native';
import {
	screenWidth,
	screenHeight,
	birdWidth,
	birdHeight,
} from './modules/helpers';
import { Score } from './components/Score';
import { Bird } from './components/Bird';
import { Pipes } from './components/Pipes';
import { Overlay } from './components/Overlay';

// position related
const initBirdBottom = screenHeight / 2;
const initPipeLeft = screenWidth;
const initPipeLeft2 = screenWidth * 2;
const initPipeHeight = 300;
const initPlaying = false;
const initGameOver = false;

const birdLeft = screenWidth / 2;
const pipeWidth = 150;
const birdHalf = birdHeight / 2;

// physics related
const gravity = 3;
let gravityTimeout = null,
	pullPipeTime = null,
	pullPipeTime2 = null;

const App = () => {
	// game status
	const [gameOver, setGameOver] = useState(initGameOver);
	const [isPlaying, setIsPlaying] = useState(initPlaying);
	const [score, setScore] = useState(0);

	// player position
	const [birdBottom, setBirdBottom] = useState(initBirdBottom);

	// pipes position
	const [pipeLeft, setPipeLeft] = useState(initPipeLeft);
	const [pipeLeft2, setPipeLeft2] = useState(initPipeLeft2);
	const [pipeHeight, setPipeHeight] = useState(initPipeHeight);
	const [pipeHeight2, setPipeHeight2] = useState(initPipeHeight);

	// ANIMATE BIRD & PIPES
	// start bird falling
	useEffect(() => {
		if (isPlaying) {
			if (birdBottom > 0) {
				gravityTimeout = setInterval(() => {
					setBirdBottom((oldBtm) => oldBtm - gravity);
				}, 30);
			}
		}

		return () => {
			clearInterval(gravityTimeout);
		};
	}, [birdBottom, isPlaying]);

	// start moving pipes
	useEffect(() => {
		if (isPlaying) {
			if (pipeLeft > -screenWidth) {
				pullPipeTime = setInterval(() => {
					setPipeLeft((oldLeft) => oldLeft - 5);
				}, 30);
			} else {
				setScore((s) => s + 1);
				setPipeHeight(
					Math.min(Math.max(225, Math.random() * 1000), 375)
				);
				setPipeLeft(screenWidth);
			}
		}

		return () => {
			clearInterval(pullPipeTime);
		};
	}, [pipeLeft, isPlaying]);

	// start second pipes pipes
	useEffect(() => {
		if (isPlaying) {
			if (pipeLeft2 > -screenWidth) {
				pullPipeTime2 = setInterval(() => {
					setPipeLeft2((oldLeft2) => oldLeft2 - 5);
				}, 30);
			} else {
				setScore((s) => score + 1);
				setPipeHeight2(
					Math.min(Math.max(200, Math.random() * 1000), 375)
				);
				setPipeLeft2(screenWidth);
			}
		}

		return () => {
			clearInterval(pullPipeTime2);
		};
	}, [pipeLeft2, isPlaying]);

	// COLLISIONS
	// pipe one: collision
	useEffect(() => {
		const collisionSpotBirdTop = birdBottom + birdHalf;
		const collisionSpotBirdBottom = birdBottom - (birdHalf - 5);

		const collisionSpotPipeTop = screenHeight - pipeHeight;
		const collisionSpotPipeBottom = pipeHeight;

		const collisionSpotBirdRight = birdLeft + birdHalf;

		const isBetweenY =
			collisionSpotBirdBottom <= collisionSpotPipeBottom ||
			collisionSpotBirdTop >= collisionSpotPipeTop;

		const collisionVicinity = [pipeLeft, pipeLeft + pipeWidth];
		const isBetweenX =
			collisionSpotBirdRight >= collisionVicinity[0] &&
			collisionSpotBirdRight <= collisionVicinity[1];

		if (isBetweenY && isBetweenX) {
			clearInterval(pullPipeTime);
			setIsPlaying(false);
			setGameOver(true);
		}
	}, [pipeHeight, birdBottom]);

	// pipe two: collision
	useEffect(() => {
		const collisionSpotBirdTop = birdBottom + birdHalf;
		const collisionSpotBirdBottom = birdBottom - (birdHalf - 5);

		const collisionSpotPipeTop = screenHeight - pipeHeight2;
		const collisionSpotPipeBottom = pipeHeight2;

		const collisionSpotBirdRight = birdLeft + birdHalf;

		const isBetweenY =
			collisionSpotBirdBottom <= collisionSpotPipeBottom ||
			collisionSpotBirdTop >= collisionSpotPipeTop;

		const collisionVicinity = [pipeLeft2, pipeLeft2 + pipeWidth];
		const isBetweenX =
			collisionSpotBirdRight >= collisionVicinity[0] &&
			collisionSpotBirdRight <= collisionVicinity[1];

		if (isBetweenY && isBetweenX) {
			clearInterval(pullPipeTime2);
			setIsPlaying(false);
			setGameOver(true);
		}
	}, [pipeHeight2, birdBottom]);

	// GAME FUNCTIONS
	// update the bird's position
	const animateBird = () => {
		setBirdBottom(birdBottom + 20);
	};

	// start the game
	const playGame = () => {
		if (!gameOver) {
			if (isPlaying) {
				animateBird();
			} else {
				setIsPlaying(true);
			}
		}
	};

	// restart the game from game over
	const restartGame = () => {
		setScore(0);

		setBirdBottom(initBirdBottom);

		setPipeLeft(initPipeLeft);
		setPipeLeft2(initPipeLeft2);

		setPipeHeight(initPipeHeight);
		setPipeHeight2(initPipeHeight);

		setGameOver(initGameOver);
	};

	return (
		<View
			style={{
				flex: 1,
				position: 'relative',
				alignItems: 'center',
				justifyContent: 'center',
				backgroundColor: '#81c784'
			}}
			onTouchStart={playGame}
		>
			{/* pipe set 1 */}
			<Pipes
				color="green"
				pipeLeft={pipeLeft}
				pipeWidth={pipeWidth}
				pipeHeight={pipeHeight}
			/>

			{/* pipe set 2 */}
			<Pipes
				color="yellow"
				pipeLeft={pipeLeft2}
				pipeWidth={pipeWidth}
				pipeHeight={pipeHeight2}
			/>

			{/* score */}
			<Score score={score} />

			{/* bird */}
			<Bird
				height={birdHeight}
				width={birdWidth}
				birdLeft={birdLeft}
				birdBottom={birdBottom}
			/>

{
				/* start game! */
				!isPlaying && !gameOver && (
					<Overlay
						title='FLAPPY SQUARE'
						footer='Tap to play'
					/>
				)
			}

			{
				/* game over */
				gameOver && (
					<Overlay
						title='GAME OVER!'
						subTitle={`Final score ${score}`}
						footer='Tap to play again'
						onTouchStart={restartGame}
					/>
				)
			}
		</View>
	);
};

export { App };
