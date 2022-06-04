import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="desk"
export default class extends Controller {
	connect() {
		setTimeout(() => {
			this.element.classList.remove('winner');
		}, 2000);
	}
}
