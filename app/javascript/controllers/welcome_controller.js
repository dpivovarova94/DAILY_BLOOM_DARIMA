// app/javascript/controllers/welcome_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "screen" ]

  connect() {
    if (!this.hasSeenWelcomeScreen()) {
      setTimeout(() => {
        this.fadeOutWelcomeScreen();
      }, 1000);
    }
  }

  fadeOutWelcomeScreen() {
    this.screenTarget.style.transition = 'opacity 1s';
    window.requestAnimationFrame(() => {
      this.screenTarget.addEventListener('transitionend', this.redirectToChallenges.bind(this));
      this.screenTarget.style.opacity = 0;
    });
    this.rememberSeenWelcomeScreen();
  }

  redirectToChallenges() {
    window.location.href = '/challenges/new';
  }

  hasSeenWelcomeScreen() {
    return localStorage.getItem('seen_welcome_screen') === 'true';
  }

  rememberSeenWelcomeScreen() {
    localStorage.setItem('seen_welcome_screen', 'true');
  }
}
