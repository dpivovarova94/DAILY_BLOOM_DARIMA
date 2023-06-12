import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="keyword"
export default class extends Controller {
  static targets = ["figure"];

  connect() {
  }

  showKeyword(event) {
    this.figureTarget.classList.toggle("d-none");
  }
}
