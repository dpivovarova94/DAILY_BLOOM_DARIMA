import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "screen" ]

  connect() {
    setTimeout(() => {
      this.fadeOutWelcomeScreen();
    }, 1000);
  }

  fadeOutWelcomeScreen() {
    this.screenTarget.style.transition = 'opacity 1s';
    window.requestAnimationFrame(() => {
      this.screenTarget.addEventListener('transitionend', this.redirectUser.bind(this));
      this.screenTarget.style.opacity = 0;
    });
  }

  redirectUser() {
    if (this.isFirstVisit()) {
      window.location.href = '/users/sign_in';
      this.rememberVisit();
    } else {
      window.location.href = '/posts';
    }
  }

  isFirstVisit() {
    return localStorage.getItem('visited_before') === null;
  }

  rememberVisit() {
    localStorage.setItem('visited_before', 'true');
  }
}
