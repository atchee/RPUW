import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="desk"
export default class extends Controller {
	connect() {
		setTimeout(() => {
			this.element.classList.remove('winner-desk');
			this.element.classList.remove('looser-desk');
		}, 2000);
	}
}
