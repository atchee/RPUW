import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="solution"
export default class extends Controller {
	connect() {
		const answers = document.querySelectorAll('.answer');

		answers.forEach((answer) => {
			answer.classList.add('answer-false');
		});

		const correctAnswer = document.querySelector('#correct');
		correctAnswer.classList.add('answer-true');
	}
}
