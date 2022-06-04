import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="timer"
export default class extends Controller {
	static values = { time: Number, gameId: Number };

	connect() {
		this.csrfToken = document
			.querySelector('meta[name="csrf-token"]')
			.getAttribute('content');

		const owner = this.element.closest('#timer').classList.contains('owner');

		this.interval = setInterval(() => {
			if (this.timeValue > 0) {
				this.element.innerText = this.timeValue - 1;
				this.timeValue = this.timeValue - 1;
				if (this.timeValue === 0 && owner) this._nextQuestion();
			}
		}, 1000);
	}

	disconnect() {
		clearInterval(this.interval);
	}

	_nextQuestion() {
		const url = `/games/${this.gameIdValue}/next_question`;
		fetch(url, {
			method: 'POST',
			headers: {
				Accept: 'text/vnd.turbo-stream.html',
				'X-CSRF-Token': this.csrfToken,
			},
		});
	}
}
