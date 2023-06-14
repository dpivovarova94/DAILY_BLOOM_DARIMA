import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["form", "bubbleContainer", "keyword"]

  connect() {
    // console.log("Hello from toggle_controller.js")
  }

  back() {
    // event.preventDefault();
    this.formTargets.forEach((element) => {
      element.classList.add("d-none")
    })
    this.bubbleContainerTarget.classList.remove("d-none")
  }
  fire(event) {
    this.formTargets.forEach((element) => {
      element.classList.add("d-none")
    })

    const formId = event.currentTarget.dataset.formId;

    const targetElement = this.formTargets.find((element) => {
      return element.id === formId;
    });

    targetElement.classList.remove("d-none");
    event.stopPropagation();
    this.bubbleContainerTarget.classList.add("d-none")
    this.keywordTarget.classList.add("d-none")
  }
}
