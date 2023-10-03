<div class="container">
	<h1 class = "mainText">누니머기와 이야기하기</h1>
	<div class="phone">
		<div class="chat" bind:this={div}>
			<header>
				<article class="snom">
					<span></span>
				</article>
			</header>

			{#each comments as comment}
				<article class={comment.author}>
					<span>{comment.text}</span>
				</article>
			{/each}
		</div>

		<input on:keydown={handleKeydown}/>
	</div>
</div>

<script>
	// @ts-nocheck
	
	  import { afterUpdate, beforeUpdate } from "svelte";
	
		/**
	   * @type {any[]}
	   */
		let comments = [];
	
		/**
	   * @type {HTMLDivElement}
	   */
		let div;
		let autoscroll = false;

		var isUsing = true;
	
		beforeUpdate(() => {
			if (div) {
				const scrollableDistance = div.scrollHeight - div.offsetHeight;
				autoscroll = div.scrollTop > scrollableDistance - 20;
			}
		});
	
		afterUpdate(() => {
			if (autoscroll) {
				div.scrollTo(0, div.scrollHeight);
			}
		});
	
		const pause = (/** @type {number | undefined} */ ms) => new Promise((fulfil) => setTimeout(fulfil, ms));
	
		const typing = { author: 'snom', text: '...' };
	
		/**
	   * @param {{ key: string; target: { value: string; }; }} event
	   */
		async function handleKeydown(event) {
			if (event.key === 'Enter') {
				if (isUsing) {
					const snomcry = ['훙와', '슈와', '아이스스', '디데데', '뽁뽁뽁', '오물오물'];
					const truefact = ['누알못! 누알못!', '누니머기는 엉덩이가 아니다!', 'SNOM ANGRY...', '거짓부렁을 퍼트리지 마라!', '누니머기는 명백한 애벌레 포켓몬이다!', '엉덩이?! 😡😡😡😡😡'];

					const randIdx = Math.floor(Math.random() * 100) % snomcry.length;
					const truerandIdx = Math.floor(Math.random() * 100) % truefact.length;

					isUsing = false;

					const comment = {
						author: 'user',
						text: event.target.value
					};
		
					const reply = {
						author: 'snom',
						text: snomcry[randIdx]
					};

					if (isNualmot(event.target.value)) {
						reply.text = truefact[truerandIdx];
					}

					event.target.value = "";
					comments = [...comments, comment];
		
					await pause(200 * (1 + Math.random()));
					comments = [...comments, typing];
		
					await pause(500 * (1 + Math.random()));
					comments = [...comments, reply].filter(comment => comment !== typing);
					isUsing = true;
				}
				else {
					event.target.value = "";
				}
			}
		}

		/**
	   * @param {{ key: string; target: { value: string; }; }} text
	   */
		function isNualmot(text) {
			if (text.indexOf("누니머기") !== -1 && text.indexOf("엉덩이") !== -1 && (text.indexOf("다") !== -1 || text.indexOf("아니") === -1)) {
				return true;
			}

			if (text.indexOf("누엉")!== -1) {
				return true;
			}

			if ((text.indexOf("Snom")!== -1 || text.indexOf("snom")!== -1) && text.indexOf("ass")!== -1 && !text.indexOf("not")!== -1 && !text.indexOf("n't")!== -1) {
				return true;
			}

			if ((text.indexOf("Snom")!== -1 || text.indexOf("snom")!== -1) && text.indexOf("おしり")!== -1 && !text.indexOf("not")!== -1 && !text.indexOf("n't")!== -1) {
				return true;
			}

			if (text.indexOf("ユキハミ")!== -1 && text.indexOf("おしり")!== -1 && !text.indexOf("not")!== -1 && !text.indexOf("n't")!== -1) {
				return true;
			}

			return false;
		}
	</script>


<style>
	.container {
		display: grid;
		place-items: center;
		height: 100%;
	}

	.mainText {
		margin: 2em 0 2em 0;
		color: #5782d0;
	}

	.phone {
		display: flex;
		flex-direction: column;
		width: 100%;
		height: 100%;
	}

	header {
		display: flex;
		flex-direction: column;
		height: 100%;
		padding: 4em 0 0 0;
		box-sizing: border-box;
	}

	h1 {
		flex: 1;
		font-size: 1.4em;
		text-align: center;
	}

	.chat {
		height: 0;
		flex: 1 1 auto;
		padding: 0 1em;
		overflow-y: auto;
		scroll-behavior: smooth;
	}

	article {
		margin: 0 0 0.5em 0;
	}

	.user {
		text-align: right;
	}

	span {
		padding: 0.5em 1em;
		display: inline-block;
	}

	.snom span {
		background-color: #BFD2F5;
		border-radius: 1em 1em 1em 0;
		color: var(--fg-1);
	}

	.user span {
		background-color: #0074d9;
		color: white;
		border-radius: 1em 1em 0 1em;
		word-break: break-all;
	}

	input {
		background-color: #a9b7cf;
		color: white;
		height: 2rem;
		margin: 0.5em 1em 1em 1em;
		padding: 0.25em 0.75em 0.25em 0.75em;
		font-size: large;
		font-weight: 200;
		border-color: #5782d0;
		border-radius: 1em;
	}

	@media (min-width: 400px) {
		.phone {
			background: #e0ebfe;
			position: relative;
			font-size: min(2.5vh, 1rem);
			width: auto;
			height: 50em;
			aspect-ratio: 9 / 16;
			border: 0.2em solid #5782d0;
			border-radius: 1em;
			box-sizing: border-box;
		}

		.phone::after {
			position: absolute;
			content: '';
			background: #5782d0;
			width: 60%;
			height: 1em;
			left: 20%;
			top: 0;
			border-radius: 0 0 0.5em 0.5em
		}
	}

	@media (prefers-reduced-motion) {
		.chat {
			scroll-behavior: auto;
		}
	}
</style>
