import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="answer"
export default class extends Controller {
	static targets = ['input', 'listButton'];

	static values = { participationId: Number };

	connect() {
		this.csrfToken = document
			.querySelector('meta[name="csrf-token"]')
			.getAttribute('content');
	}

	revealAnswer(evt) {
		evt.preventDefault();

		const answerId = evt.params.answerId;
		const url = `/participations/${this.participationIdValue}/answer?answer_id=${answerId}`;
		fetch(url, {
			method: 'POST',
			headers: {
				Accept: 'text/vnd.turbo-stream.html',
				'X-CSRF-Token': this.csrfToken,
			},
		});

		this.listButtonTarget.style.pointerEvents = 'none';
	}
}
